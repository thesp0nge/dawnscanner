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
  # Last update: Mon Oct  3 18:42:01 CEST 2016
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

    def initialize(db_path=nil)
      if $logger.nil?
        require 'dawn/logger'
        $logger = Logger.new(STDOUT)
        $logger.helo "knowledge-base-experimental", Dawn::VERSION
      end


      lines = ""

      $path = File.join(Dir.pwd, "db")
      $path = db_path unless db_path.nil?

      unless File.exists?(File.join($path, "kb.yaml"))
        $logger.error  "Missing kb.yaml in #{path}. Giving up"
        raise "Missing kb.yaml in #{path}. Giving up"
      end

      unless File.exists?(File.join($path, "kb.yaml.sig"))
        $logger.error  "Missing kb.yaml signature in #{path}. Giving up"
        raise "Missing kb.yaml signature in #{path}. Giving up" 
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
        raise "kb.yaml signature mismatch. Found #{hash_file} while expecting #{hash_orig}. Giving up"
      end
    end

    # Check if the local KB is packet or not.
    #
    # Returns true if at least one KB tarball file it has been found in the
    # local DB path
    def packed?
      FILES.each do |fn|
        return true if fn.end_with? 'tar.gz' and File.exists?(File.join($path, fn))
      end

      return false
    end

    def find(name)
    end

    def self.kb_descriptor
      {:kb=>{:version=>"0.0.1", :revision=>Time.now.strftime("%Y%m%d"), :api=>Dawn::VERSION}}.to_yaml
    end

    def need_update?
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
    def load(options={})
      @security_checks = []

      enabled_checks  = options[:enabled_checks]  unless options[:enabled_checks].nil?
      mvc             = options[:mvc]             unless options[:mvc].nil?
      path            = options[:path]            unless options[:path].nil?



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

    def __verify_hash(original, computed)
      t=original.split(' ')
      return false if t.length != 2
      return (t[0] == computed)
    end

  end
end
