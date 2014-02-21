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

        def is_same_version?(safe_version, detected_version)

          debug_me "is_same_version? SAFE=#{safe_version}, DETECTED=#{detected_version}"

          return (safe_version[0] == detected_version[0]) && (safe_version[1] == detected_version[1]) if (safe_version.count == 2) && (detected_version.count == 2)
          return (safe_version[0] == detected_version[0]) && (safe_version[1] == detected_version[1]) && (safe_version[2] == detected_version[2]) if (safe_version.count == 3) && (detected_version.count == 3)
        end

        def is_vulnerable_version?(safe_version, detected_version)
          major = is_vulnerable_major?(safe_version, detected_version)
          minor = is_vulnerable_minor?(safe_version, detected_version)

          debug_me "is_vulnerable_version? MAJOR=#{major} MINOR=#{minor} PATCH=#{safe_version[2] >= detected_version[2]}"
          return true if major && minor && (safe_version[2] > detected_version[2])
          return false if (!major) && (!minor) && (safe_version[2] <= detected_version[2])
        end

        def is_deprecated?(detected_version)
          @deprecated.each do |dep|
            debug_me "DEPRECATED_VERSION: #{dep}"
            debug_me "DETECTED_VERSION: #{detected_version}"
            dep_v = version_string_to_array(dep)
            det_v = version_string_to_array(detected_version)
            return true if is_same_version?(dep_v, det_v)
            if dep_v[0] == 'x'
              # deprecation version is something like 'x.0.0'. This is a
              # nonsense since it means all versions are deprecated. However
              # I'll support also nonsense checks.

              $logger.warn "Setting the predicate #{dep} will mark all versions as deprecated"
              debug_me "You kindly mark #{detected_version} as deprecated with this predicate #{dep}"
              return true

            end
          end
          false
        end


        ## 
        # It takes a string representing a version and it splits it in a Fixnum array.
        #
        # e.g.
        # version_string_to_array("3.2.3") #=> [3,2,3] 
        def version_string_to_array(string)
          return string.split(".").map! { |n| (n=='x')? n : n.to_i } 
        end

      end
    end
  end
end
