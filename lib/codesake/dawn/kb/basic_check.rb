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

        # Tells a version is not vulnerable even if in the fixes array that has
        # a minor version number higher than the current.
        # This is useful especially for rails version where 3.0.x, 3.1.y, 3.2.z
        # are separated branches and the patch is provided for all of those. So
        # if version 3.1.10 is safe and you have it, you don't be prompted
        # about 3.2.x.
        attr_accessor :save_minor_fixes

        def initialize(options={})
          @applies                  = []
          @ruby_version             = ""
          @ruby_vulnerable_versions = []
          @save_minor_fixes         = false

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

        # @target_version = '2.3.11'
        # @fixes_version = ['2.3.18', '3.2.13', '3.1.12' ] 
        def is_vulnerable_version?(target = nil, fixes = nil)
          target  = @target_version if target.nil?
          fixes   = @fixes_version  if fixes.nil?
          return false if target.nil? || fixes.empty?

          ret = false

          target_v_array = target.split(".").map! { |n| n.to_i }
          fixes.sort.each do |fv|
            fixes_v_array = fv.split(".").map! { |n| n.to_i }

            debug_me "target_array = #{target_v_array}"
            debug_me "fixes_array = #{fixes_v_array}"
            if target_v_array[0] == fixes_v_array[0]
              # SAME MAJOR RELEASE
              ret = true if target_v_array[1] < fixes_v_array[1] # same major but previous minor
              if target_v_array[1] == fixes_v_array[1] 
                # SAME MINOR RELEASE
                # This is the case of version number made by 2 digits (e.g.
                # 3.12). If both major and minor are the same then there is no
                # vuln
                return false if target_v_array.count == 2 && fixes_v_array.count == 2

                # This it the case of the vulneable version that is made by 2
                # digit and fixed one made by 3. (eg. all the 6.2.x is
                # vulnerable and 6.2 without patchlevel is found.
                return true if target_v_array.count == 2 && fixes_v_array.count == 3

                ret = true if target_v_array[2] < fixes_v_array[2] 
                # In order to support CVE-2013-7086 security check we must be able to 
                # hande the 'fourth' version number -> 1.5.0.4 
                debug_me "target array count = #{target_v_array.count}"
                debug_me "fixes array count = #{fixes_v_array.count}"
                debug_me "same patchlevel?: #{(target_v_array[2] == fixes_v_array[2])}"
                if (target_v_array[2] == fixes_v_array[2]) && target_v_array.count == 4 && fixes_v_array.count == 4
                  ret = true if target_v_array[3] < fixes_v_array[3]
                  ret = false if target_v_array[3] >= fixes_v_array[3]
                end
                ret = false if (target_v_array[2] == fixes_v_array[2]) && target_v_array.count != 4 && fixes_v_array.count != 4
                ret = false if target_v_array[2] > fixes_v_array[2] 

              end
            end
            # This is the save minor version workaround.
            # fixes is something like ['2.2.2', '3.1.1', '3.2.2']
            # target is '3.1.1' and save_minor_fixes is true
            # I don't want that check for 3.2.2 marks this as vulnerable, so I will save it
            debug_me "save minor fixes flag is #{save_minor_fixes}"
            debug_me "is_there_an_higher_minor_version? is #{is_there_an_higher_minor_version?(fixes, fv)}"
            if target_v_array[0] == fixes_v_array[0] && target_v_array[1] == fixes_v_array[1] && target_v_array[2] >= fixes_v_array[2] && is_there_an_higher_minor_version?(fixes, fv) && save_minor_fixes
              debug_me "Honoring save_minor_fixes flag. Found a version #{target} that matches #{fixes} but there is another fixed version with higher minor version"
              return false
            end

            debug_me("RET IS #{ret}")
            ret = false if is_not_affected?(target_v_array)
            debug_me("RET AFTER NOT AFFECTED CHECK IS #{ret}")

          end

          ret
        end

        def is_not_affected?(detected_gem_version)
          return false if self.kind != Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK
          return false if self.not_affected.nil?
          self.not_affected[:version].each do |na|
            na_array = na.split(".").map! { |n| n.to_i }
            debug_me("na_array: #{na_array}")
            debug_me("detected_gem_version: #{detected_gem_version}")

            return false if detected_gem_version[0] > na_array[0]
            return true if detected_gem_version[0] < na_array[0] && self.not_affected[:earlier]

            # here the two versions have the same major number
            return true if detected_gem_version[1] == na_array[1]
            return true if detected_gem_version[1] < na_array[1] && self.not_affected[:earlier]
            
          end
          debug_me("IS_NOT_AFFECTED? IS FALSE")
          return false
        end

        def cvss_score
          return Cvss::Engine.new.score(self.cvss) unless self.cvss.nil?
          "    "
        end

        def mitigated?
          self.mitigated
        end

        # checks in the array if there is another string with higher minor version but the same major as the parameter element)
        def is_there_an_higher_minor_version?(array, element)
          ev = element.split(".").map! { |n| n.to_i }
          array.sort.each do |a|
            av = a.split(".").map! { |n| n.to_i }
            return true if ev[0] == av[0] && ev[1] < av[1]
          end
          return false

        end

      end
    end
  end
end
