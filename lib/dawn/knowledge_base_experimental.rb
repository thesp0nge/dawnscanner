require 'singleton'

# For HTTPS communication to check for KB updates and to fetch them
require 'net/http'
require 'uri'

require 'yaml'
require 'digest'

module Dawn
  # This is the YAML powered experimental knowledge base
  #
  # When the old KB format, using Ruby classes will be marked as deprecated,
  # than this one will be the official.
  #
  # Dawnscanner KB will be a bunch of YAML file, stored in a hierachy of
  # directories resembling security checks family. A digital signature will be
  # also available to prevent KB tampering.
  #
  # This class will be accountable for:
  #   + check for KB upgrade
  #   + fetching the KB file from the Internet
  #   + verifying the database signature
  #   + reading YAML file, creating the security check array
  #
  # Another big change will be the MVC passed as constructor parameter, so only
  # the checks regarding the particular app, will be loaded in the security
  # check array. This should speed up BasicCheck internal routines.
  #
  # Class usage will be very simple. After getting the singleton instance, you
  # will load the KB content. The load method will be also responsible about
  # all relevant checks.
  #
  # Example
  #
  # require "dawn/knowledge_base_experimental"
  #
  # ...
  #
  # d = Dawn::KnowledgeBaseExperimental.instance
  # d.update if d.update?
  # d.load
  #
  # Last update: Fri Oct  7 08:03:43 CEST 2016
  class KnowledgeBaseExperimental
    include Dawn::Utils
    include Singleton

    GEM_CHECK           = :rubygem_check
    DEPENDENCY_CHECK    = :dependency_check
    PATTERN_MATCH_CHECK = :pattern_match_check
    RUBY_VERSION_CHECK  = :ruby_version_check
    OS_CHECK            = :os_check
    COMBO_CHECK         = :combo_check
    CUSTOM_CHECK        = :custom_check

    REMOTE_KB_URL_PREFIX  = "https://dawnscanner.org/data/"
    FILES = %w(kb.yaml bulletin.tar.gz generic_check.tar.gz owasp_ror_cheatsheet.tar.gz code_style.tar.gz code_quality.tar.gz owasp_top_10.tar.gz signatures.tar.gz)


    attr_reader :security_checks
    attr_reader :descriptor
    attr_reader :path

    def initialize(options={})
      if $logger.nil?
        require 'dawn/logger'
        $logger = Logger.new(STDOUT)
        $logger.helo "knowledge-base-experimental", Dawn::VERSION
      end
    end



    def find(name)
    end

    def self.kb_descriptor
      {:kb=>{:version=>"0.0.1", :revision=>Time.now.strftime("%Y%m%d"), :api=>Dawn::VERSION}}.to_yaml
    end

    def update?
      FileUtils.mkdir_p("tmp")
      begin
        response = Net::HTTP.get URI(REMOTE_KB_URL_PREFIX + "kb.yaml")
        open("tmp/kb.yaml", "w") do |f|
          f.puts(response)
        end
        response = Net::HTTP.get URI(REMOTE_KB_URL_PREFIX + "kb.yaml.sig")
        open("tmp/kb.yaml.sig", "w") do |f|
          f.puts(response)
        end
      rescue Exception => e
        $logger.error e.to_s
        return false
      end

      # Verify kb.yaml signature

      YAML.load(response)
    end

    def all
      @security_checks
    end

    # Load security checks from db/ folder.
    #
    # options - The list of the options to be passed to KB. It can contain:
    #   + enabled_checks: an array of security checks that must be enabled
    #      [:generic_check, :code_quality, :bulletin, :code_style, :owasp_ror_cheatsheet, :owasp_top_10]
    #   + mvc: the mvc name for the target application, in order for the KB to
    #          deselect all security checks that don't fit the code to be
    #          reviewed.
    #   + path: the path for the KB root folder. Please note that #{Dir.pwd}/db
    #           is the default location.
    #
    # Returns an array of security checks, matching the mvc to be reviewed and
    # the enabled check list or an empty array if an error occured.
    def load(options={})
      @security_checks = []
      $path = File.join(Dir.pwd, "db")

      enabled_checks  = options[:enabled_checks]  unless options[:enabled_checks].nil?
      mvc             = options[:mvc]             unless options[:mvc].nil?
      $path           = options[:path]            unless options[:path].nil?

      unless __valid?
        $logger.error "An invalid library it has been found. Please use --recovery flag to force fresh install from dawnscanner.org"
        return []
      end

      unless __load?
        $logger.error "The library must be consumed with dawnscanner up to v#{$descriptor["kb"]["api"]}. You are using dawnscanner v#{Dawn::VERSION}"
        return []
      end

      # TODO: untar and unzip from here (look for it in Google)
      if __packed?
        $logger.info "a packed knowledge base it has been found. Unpacking it"
        __unpack
      end

      enabled_checks.each do |d|

        dir = File.join($path, d)

        # Please note that if we enter in this branch, it means someone
        # tampered the KB between the previous __valid? check and this point.
        # Of course this is a very rare situation, but we must handle it.
        unless Dir.exists?(dir)
          $logger.critical "Missing check directory #{dir}"
          $logger.error "An invalid library it has been found. Please use --recovery flag to force fresh install from dawnscanner.org"
          return []
        end

        # Enumerate all YAML file in the give dir

      end

    end

    def dump(verbose=false)
      puts "Security checks currently supported:"
      i=0
      KnowledgeBaseExperimental.instance.all.each do |check|
        i+=1
        if verbose
          puts "Name: #{check.name}\tCVSS: #{check.cvss_score}\tReleased: #{check.release_date}"
          puts "Description\n#{check.message}"
          puts "Remediation\n#{check.remediation}\n\n"
        else
          puts "#{check.name}"
        end
      end
      puts "-----\nTotal: #{i}"

    end

    private

    def __verify_hash(original, computed)
      t=original.split(' ')
      return false if t.length != 2
      return (t[0] == computed)
    end

    def __valid?

      lines = ""

      unless File.exists?(File.join($path, "kb.yaml"))
        $logger.error  "Missing kb.yaml in #{path}. Giving up"
        return false
      end

      unless File.exists?(File.join($path, "kb.yaml.sig"))
        $logger.error  "Missing kb.yaml signature in #{path}. Giving up"
        return false
      end

      lines = File.read(File.join($path, "kb.yaml"))
      hash_file = Digest::SHA256.hexdigest lines
      hash_orig = File.read(File.join($path, "kb.yaml.sig"))

      v = __verify_hash(hash_orig, hash_file)
      if v
        $logger.info("good kb.yaml file found. Reading knowledge base descriptor")
        @descriptor = YAML.load(lines)
      else
        $logger.error("kb.yaml signature mismatch. Found #{hash_file} while expecting #{hash_orig}. Giving up")
        return false
      end

      return true
    end

    # Check if the local KB is packet or not.
    #
    # Returns true if at least one KB tarball file it has been found in the
    # local DB path
    def __packed?
      FILES.each do |fn|
        return true if fn.end_with? 'tar.gz' and File.exists?(File.join($path, fn))
      end
      return false
    end

    def __unpack

    end

    def __load?
      api = $descriptor["kb"]["api"]
      v = Dawn::VERSION
      require "dawn/kb/version_check"

      vc = VersionCheck.new
      return true if vc.is_higher?(api, v) # => true if v > api
      return false
    end


  end
end
