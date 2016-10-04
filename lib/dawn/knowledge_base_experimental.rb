require 'singleton'

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

    attr_reader :security_checks

    def find(name)
    end

    def all
      @security_checks
    end
    def all_by_mvc(mvc)
      ret = []
      @security_checks.each do |sc|
        ret << sc if sc.applies_to?(mvc)
      end
      ret
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

      enabled_checks  = options[:enabled_checks] unless options[:enabled_checks].nil?
      mvc             = options[:mvc] unless options[:mvc].nil?
      path            = options[:path] unless options[:path].nil?



    end

    def dump(verbose=false)
      puts "Security checks currently supported:"
      i=0
      self.new.all.each do |check|
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


  end
end
