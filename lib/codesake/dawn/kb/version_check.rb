module Codesake
  module Dawn
    module Kb
      class VersionCheck
        include BasicCheck

        attr_accessor :safe
        attr_accessor :deprecated
        attr_accessor :excluded
        attr_accessor :detected


        def initialize(options={})
          super(options)
          debug_me "VersionCheck initialized"
        end

        def vuln?
          debug_me "Detected version is #{@detected}"
          debug_me "Safe versions array is #{@safe}"
          debug_me "Deprecated versions array is #{@deprecated}. I'll mark them as vulnerable"
          debug_me "Excluded versions array is #{@excluded}. I'll mark them as not vulnerable"

          ret = false
          ret
        end

        # private I'll mark this section as private after all tests...


        def is_good_parameter?(array)
          return false if array.nil?
          return false if array.empty?
          return true
        end
        ##
        # It checks if the first digit of a version array is the same
        #
        # e.g.
        # has_same_major?([2,3,3], [1,2,2]) #=> false
        # has_same_major?([2,3,3], [2,2,2]) #=> true
        def is_same_major?(array_a, array_b)
          return false if ! is_good_parameter?(array_a) || ! is_good_parameter?(array_b)
          return (array_a[0] == array_b[0])
        end

        def is_vulnerable_major?(safe_version, detected_version)
          ret = false
          ret = true if safe_version[0] >= detected_version[0]
          ret
        end

        def is_vulnerable_minor?(safe_version, detected_version)
          if safe_version.length < detected_version.length
            # safe version is just the major number e.g. 2
            # detected version is kinda more complex e.g. 2.3.2 or 1.2.3
            # we relay on major here
            return is_vulnerable_major?(safe_version, detected_version)
          end
          if safe_version.length > detected_version.length
            # detected version is just the major number e.g. 2
            # safe version is kinda more complex e.g. 2.3.2 
            # in this case we return the version is vulnerable if the
            # detected_version major is less or equal the safe one.
            return (safe_version[0] <= detected_version[0])
          end

          # support for x as safe minor version
          return false if is_same_major?(safe_version, detected_version) && safe_version[1] == 'x'
          return true if safe_version[1] >= detected_version[1]
          return false if safe_version[1] < detected_version[1]
        end

        def is_same_version?(safe_version_array, detected_version_array)
          return (safe_version_array[0] == detected_version_array[0]) && (safe_version_array[1] == detected_version_array[1]) if (safe_version_array.count == 2) && (detected_version_array.count == 2)
          return (safe_version_array[0] == detected_version_array[0]) && (safe_version_array[1] == detected_version_array[1]) && (safe_version_array[2] == detected_version_array[2]) if (safe_version_array.count == 3) && (detected_version_array.count == 3)
        end
        
        #########################
        # Beta version handling
        #
        #########################

        def is_beta_check?(safe_version_beta, detected_version_beta)
          ( safe_version_beta != 0 || detected_version_beta != 0)
        end

        def is_vulnerable_beta?(safe_version_beta, detected_version_beta)
          
          debug_me "SVB=#{safe_version_beta} - DVB=#{detected_version_beta}"
          # if the safe_version_beta is 0 then the detected_version_beta is
          # vulnerable by design, since the safe version is a stable and we
          # detected a beta.
          return true if safe_version_beta == 0 && detected_version_beta != 0
          return false if safe_version_beta <= detected_version_beta
          return true if safe_version_beta > detected_version_beta

          # fallback
          return false 
        end

        #########################
        # Rc version handling
        #
        #########################

        def is_rc_check?(safe_version_rc, detected_version_rc)
          ( safe_version_rc != 0 || detected_version_rc != 0)
        end

        def is_vulnerable_rc?(safe_version_rc, detected_version_rc)
          
          debug_me "SVB=#{safe_version_rc} - DVB=#{detected_version_rc}"
          # if the safe_version_rc is 0 then the detected_version_rc is
          # vulnerable by design, since the safe version is a stable and we
          # detected a rc.
          return true if safe_version_rc == 0 && detected_version_rc != 0
          return false if safe_version_rc <= detected_version_rc
          return true if safe_version_rc > detected_version_rc

          # fallback
          return false 
        end

        #########################
        # pre version handling
        #
        #########################

        def is_pre_check?(safe_version_pre, detected_version_pre)
          ( safe_version_pre != 0 || detected_version_pre != 0)
        end

        def is_vulnerable_pre?(safe_version_pre, detected_version_pre)
          
          debug_me "SVB=#{safe_version_pre} - DVB=#{detected_version_pre}"
          # if the safe_version_pre is 0 then the detected_version_pre is
          # vulnerable by design, since the safe version is a stable and we
          # detected a pre.
          return true if safe_version_pre == 0 && detected_version_pre != 0
          return false if safe_version_pre <= detected_version_pre
          return true if safe_version_pre > detected_version_pre

          # fallback
          return false 
        end

        def is_vulnerable_version?(safe_version, detected_version)
          sva = version_string_to_array(safe_version)
          dva = version_string_to_array(detected_version)
          safe_version_array = sva[:version]
          detected_version_array = dva[:version]

          debug_me "SAFE_VERSION_ARRAY = #{safe_version_array}"
          debug_me "DETECTED_VERSION_ARRAY = #{detected_version_array}"

          major = is_vulnerable_major?(safe_version_array, detected_version_array)
          minor = is_vulnerable_minor?(safe_version_array, detected_version_array)

          debug_me "is_vulnerable_version? MAJOR=#{major} MINOR=#{minor} PATCH=#{safe_version[2] >= detected_version[2]}"

          return is_vulnerable_beta?(sva[:beta], dva[:beta]) if is_same_version?(safe_version_array, detected_version_array) && is_beta_check?(sva[:beta], dva[:beta])
          return is_vulnerable_rc?(sva[:rc], dva[:rc]) if is_same_version?(safe_version_array, detected_version_array) && is_rc_check?(sva[:rc], dva[:rc])
          return is_vulnerable_pre?(sva[:pre], dva[:pre]) if is_same_version?(safe_version_array, detected_version_array) && is_pre_check?(sva[:pre], dva[:pre])

          return true if major && minor && (safe_version[2] > detected_version[2])
          return false if (!major) && (!minor) && (safe_version[2] <= detected_version[2])
        end

        def is_deprecated?(detected_version)
          @deprecated.each do |dep|
            debug_me "DEPRECATED_VERSION: #{dep}"
            debug_me "DETECTED_VERSION: #{detected_version}"
            dep_v = version_string_to_array(dep)[:version]
            det_v = version_string_to_array(detected_version)[:version]
            return true if is_same_version?(dep_v, det_v)
            if dep_v[0] == 'x'
              # deprecation version is something like 'x.0.0'. This is a
              # nonsense since it means all versions are deprecated. However
              # I'll support also nonsense checks.

              $logger.warn "Setting the predicate #{dep} will mark all versions as deprecated"
              debug_me "You kindly mark #{detected_version} as deprecated with this predicate #{dep}"
              return true
            end

            if dep_v[1] == 'x'
              # deprecation version is something like 1.x
              # detected version is deprecated if major == 1. If 0 not
              return true if det_v[0] == dep_v[0]
            end

            if dep_v[2] == 'x'
              # deprecation version is something like 1.2.x
              # detected version is deprecated if major == 1 and minor == 2. 
              return true if det_v[0] == dep_v[0] && det_v[1] == dep_v[1]

            end
          end
          false
        end


        ## 
        # It takes a string representing a version and it splits it in an Hash.
        #
        # e.g.
        # version_string_to_array("3.2.3") #=> {:version=>[3,2,3], :beta=>0, :rc=>0}
        # version_string_to_array("3.2.2.beta1") #=> {:version=>[3,2,2], :beta=>1, :rc=>0}
        def version_string_to_array(string)
          # I can't use this nice onliner... stays here until I finish writing new code.
          # return string.split(".").map! { |n| (n=='x')? n : n.to_i } 
          ver   = []
          beta  = 0
          rc    = 0
          pre   = 0

          string.split(".").each do |x|
            ver << x.to_i unless x == 'x' || x.start_with?('beta') || x.start_with?('rc') || x.start_with?('pre')
            ver << x if x == 'x'

            beta = x.split("beta")[1].to_i if x.class == String && x.start_with?('beta') && beta == 0 
            rc = x.split("rc")[1].to_i if x.class == String && x.start_with?('rc') && rc == 0
            pre = x.split("pre")[1].to_i if x.class == String && x.start_with?('pre') && pre == 0

          end
          debug_me "VERSION = #{ver}, BETA=#{beta}, RC=#{rc}, PRE=#{pre}"
          {:version=>ver, :beta=>beta, :rc=>rc, :pre=>pre}
        end

      end
    end
  end
end
