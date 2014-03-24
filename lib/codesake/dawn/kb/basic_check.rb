require 'cvss'

module Codesake
  module Dawn
    module Kb
      module BasicCheck

        include Codesake::Dawn::Utils

        attr_reader :name
        attr_reader :cvss
        attr_reader :cwe
        attr_reader :owasp
        attr_reader :release_date
        attr_reader :applies
        attr_reader :kind
        attr_reader :message
        attr_reader :remediation
        attr_reader :aux_links
        attr_reader :mitigated

        # This is the ruby version used by the target application. set in
        # Engine class around line #107
        attr_accessor :ruby_version

        # This is an array of ruby versions that lead a parcitular version to
        # be exploitable.
        # In example, consider CVE-2013-1655, the Puppet rubygem version
        # vulnerability can be exploited only if ruby version is 1.9.3 or
        # higher
        attr_reader :ruby_vulnerable_versions

        # The framework target version
        attr_reader   :target_version
        # The versions of the framework that fixes the vulnerability
        attr_reader   :fixes_version

        # Vulnerability evidences
        attr_reader   :evidences

        # Check status. Returns the latest vuln? call result
        attr_reader   :status

        # Put the check in debug mode
        attr_accessor :debug

        # This is a flag for the security check family. Valid values are:
        #   + generic_check
        #   + cve_bulletin
        #   + coding_style
        #   + owasp_top_10_n (where n is a number between 1 and 10)
        attr_accessor :check_family

        # This is the check severity level. It tells how dangerous is the
        # vulnerability for you application.
        #
        # Valid values are:
        #   + :critical
        #   + :high
        #   + :medium
        #   + :low
        #   + :info
        #   + :none
        attr_accessor :severity

        # This is the check priority level. It tells how fast you should
        # mitigate the vulnerability.
        #
        # Valid values are:
        #   + :critical
        #   + :high
        #   + :medium
        #   + :low
        #   + :info
        #   + :none
        attr_accessor :priority

        def initialize(options={})
          @applies                  = []
          @ruby_version             = ""
          @ruby_vulnerable_versions = []

          @name         = options[:name]
          @cvss         = options[:cvss]
          @cwe          = options[:cwe]
          @owasp        = options[:owasp]
          @release_date = options[:release_date]
          @applies      = options[:applies] unless options[:applies].nil?
          @kind         = options[:kind]
          @message      = options[:message]
          @remediation  = options[:mitigation]
          @aux_links    = options[:aux_links]

          @target_version = options[:target_version]
          @fixes_version  = options[:fixes_version]
          @ruby_version   = options[:ruby_version]

          @evidences    = []
          @evidences    = options[:evidences] unless options[:evidences].nil?
          @mitigated    = false
          @status       = false
          @debug        = false
          @severity     = :none
          @priority     = :none
          @check_family = :generic_check

          if $logger.nil?
            $logger  = Codesake::Commons::Logging.instance
            $logger.helo "dawn-basic-check", Codesake::Dawn::VERSION
          end
        end

        def applies_to?(name)
          ! @applies.find_index(name).nil?
        end
        def cve_link
          "http://cve.mitre.org/cgi-bin/cvename.cgi?name=#{@name}"
        end
        def nvd_link
          "http://web.nvd.nist.gov/view/vuln/detail?vulnId=#{@name}"
        end
        def rubysec_advisories_link
          "http://www.rubysec.com/advisories/#{@name}/"
        end

        # Public: checks if the ruby version used for target application works a pre-requisite to exploit a particular vulnerability.
        #
        #   Take the CVE-2013-1655 as example. The Puppet rubygem vulnerability
        #   can be exploited only if the ruby version is 1.9.3 or following. For
        #   such a reason this method will check for the ruby version used by the
        #   target.
        #
        # Returns:
        #   true if the running ruby is vulnerable or false otherwise
        def is_ruby_vulnerable_version?
          return false if @ruby_vulnerable_versions.nil?

          found = false

          @ruby_vulnerable_versions.each do |v|
            found = true if v == @ruby_version
          end

          found
        end

        def cvss_score
          return Cvss::Engine.new.score(self.cvss) unless self.cvss.nil?
          "    "
        end

        def mitigated?
          self.mitigated
        end

      end
    end
  end
end
