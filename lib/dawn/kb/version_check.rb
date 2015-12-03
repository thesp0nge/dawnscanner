module Dawn
  module Kb
    class VersionCheck
      include BasicCheck

      attr_accessor :safe
      attr_accessor :deprecated
      attr_accessor :excluded
      attr_accessor :detected
      attr_accessor :save_minor
      attr_accessor :save_major
      attr_reader   :status
      attr_accessor :enable_warning


      def initialize(options={})
        super(options)
        @safe       ||= options[:safe]
        @deprecated ||= options[:deprecated]
        @excluded   ||= options[:excluded]
        @detected   ||= options[:detected]
        @save_minor ||= options[:save_minor]
        @save_major ||= options[:save_major]
        @debug      ||= options[:debug]
        @enable_warning ||= options[:enable_warning]
        debug_me "VersionCheck initialized"
      end

      def vuln?
        debug_me "Detected version is #{@detected}"
        debug_me "Safe versions array is #{@safe}"
        debug_me "Deprecated versions array is #{@deprecated}. I'll mark them as vulnerable" unless @deprecated.nil?
        debug_me "Excluded versions array is #{@excluded}. I'll mark them as not vulnerable" unless @excluded.nil?
        debug_me "SAVE_MINOR FLAG = #{@save_minor}"
        debug_me "SAVE_MAJOR FLAG = #{@save_major}"

        @status = :deprecated if is_detected_deprecated?
        return debug_me_and_return_false("detected version #{detected} is marked to be excluded for vulnerable ones")   if is_detected_excluded?

        # is the detected version in the safe array?
        return debug_me_and_return_false("detected version #{@detected} found as is in safe array")      if is_detected_in_safe?
        return debug_me_and_return_false("detected version #{@detected} is higher than all version marked safe")  if is_detected_highest?

        @safe.sort.each do |s|

          @save_minor_fix   = save_minor_fix
          @save_major_fix   = save_major_fix


          vuln  = is_vulnerable_version?(s, @detected)

          debug_me "VULN=#{vuln} SAVE_MINOR=#{@save_minor_fix} SAVE_MAJOR=#{@save_major_fix}"
          return true if vuln
        end

        return false
      end

      def is_detected_in_safe?
        @safe.each do |s|
          return true if @detected == s
        end
        return false
      end

      def is_detected_highest?
        higher= @detected
        @safe.sort.each do |s|
          debug_me("higher is #{higher}")
          higher=s if is_higher?(s, higher)
        end
        return (higher == @detected)
      end
      def is_detected_deprecated?
        return is_deprecated?(@detected)
      end
      def is_detected_excluded?
        return is_excluded?(@detected)
      end

      def is_higher_major?(s,d)
        sa = version_string_to_array(s)[:version]
        da = version_string_to_array(d)[:version]
        return (sa[0] > da[0])
      end

      # Public: tells if a version is higher than another
      #
      # e.g.
      #   is_higher?('2.3.2', '2.4.2') => true
      #   is_higher?('2.3.2', '2.3.2') => true
      def is_higher?(a, b)
        aa = version_string_to_array(a)
        ba = version_string_to_array(b)

        ver = false
        beta = false
        rc = false
        same = false

        # Version arrays are just major.minor version. Let's assume
        # patchlevel is 0 for sake of comparison.
        aa[:version] << 0 if aa[:version].count == 2
        ba[:version] << 0 if ba[:version].count == 2
        ver = true if aa[:version][0] > ba[:version][0]
        ver = true if aa[:version][0] == ba[:version][0] && aa[:version][1] > ba[:version][1]
        ver = true if aa[:version].count == 3 && ba[:version].count == 3 && aa[:version][0] == ba[:version][0] && aa[:version][1] == ba[:version][1] && aa[:version][2] > ba[:version][2]
        ver = true if aa[:version].count == 4 && ba[:version].count == 4 && aa[:version][0] == ba[:version][0] && aa[:version][1] == ba[:version][1] && aa[:version][2] == ba[:version][2] && aa[:version][3] > ba[:version][3]
        ver = true if aa[:version].count == 4 && ba[:version].count == 4 && aa[:version][0] == ba[:version][0] && aa[:version][1] == ba[:version][1] && aa[:version][2] > ba[:version][2]
        same = is_same_version?(aa[:version], ba[:version])
        beta = true if aa[:beta] >= ba[:beta]
        rc = true if aa[:rc] >= ba[:rc]

        ret = false
        ret = ver && beta && rc unless same
        ret = beta && rc if same

        debug_me("is_higher? a=#{a}, b=#{b} VER=#{ver} - BETA=#{beta} - RC=#{rc} - SAME=#{same} - a>b? = (#{ret})")
        return ret
      end

      # checks in the array if there is another string with higher major version
      def is_there_an_higher_major_version?
        dva = version_string_to_array(@detected)[:version]
        @safe.sort.each do |s|
          sva = version_string_to_array(s)[:version]
          debug_me "is_there_an_higher_major_version? DVA=#{dva} - SVA=#{sva}"
          return debug_me_and_return_true("is_there_an_higher_major_version? is returning true for #{@detected}") if dva[0] < sva[0]
        end
        return debug_me_and_return_false("is_there_an_higher_major_version? is returning false")
      end

      # checks in the array if there is another string with higher minor version but the same major as the parameter element)
      def is_there_an_higher_minor_version?
        dva = version_string_to_array(@detected)[:version]
        @safe.sort.each do |s|
          sva = version_string_to_array(s)[:version]
          return true if dva[0] == sva[0] && dva[1] < sva[1]
        end
        return false
      end

      def save_major_fix
        return false unless @save_major
        return is_there_an_higher_major_version?
      end
      ##
      # This functions handles an hack to save a detected version even if a
      # safe version with an higher minor version number has been found.
      #
      # This is mostly used in rails where there are different versions and
      # if a 3.2.12 is safe it should not marked as vulnerable just because
      # you can either use 3.3.x that is a different branch.
      #
      # It returns true when the detected version must be saved, false otherwise.
      def save_minor_fix
        return false unless @save_minor
        hm = is_there_an_higher_minor_version?

        # This is the save minor version workaround.
        # fixes is something like ['2.2.2', '3.1.1', '3.2.2']
        # target is '3.1.1' and save_minor_fixes is true
        # I don't want that check for 3.2.2 marks this as vulnerable, so I will save it
        dva = version_string_to_array(@detected)[:version]
        @safe.sort.each do |s|
          sva = version_string_to_array(s)[:version]
          debug_me("#SVA=#{sva};DVA=#{dva};SM=#{is_same_major?(sva, dva)};sm=#{is_same_minor?(sva, dva)}; ( dva[2] >= sva[2] )=#{(dva[2] >= sva[2])}")
          return true if is_same_major?(sva, dva) && is_same_minor?(sva, dva) && dva[2] >= sva[2] && hm
          return true if is_same_major?(sva, dva) && hm
        end
        return false
      end

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
      def is_same_minor?(array_a, array_b)
        return false if ! is_good_parameter?(array_a) || ! is_good_parameter?(array_b)
        return (array_a[1] == array_b[1])
      end
      def is_same_patch?(array_a, array_b)
        return false if ! is_good_parameter?(array_a) || ! is_good_parameter?(array_b)
        return (array_a[2] == array_b[2])
      end

      def is_vulnerable_major?(safe_version, detected_version)
        return (safe_version[0] > detected_version[0])
      end

      def is_vulnerable_patch?(safe_version, detected_version)
        return false if safe_version[2].nil? || detected_version[2].nil?
        return (safe_version[2] > detected_version[2])
      end
      def is_vulnerable_aux_patch?(safe_version, detected_version)
        return false if safe_version[3].nil? || detected_version[3].nil?
        return (safe_version[3] > detected_version[3])
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
        return false if safe_version[0] <= detected_version[0] && safe_version[1] == 'x'
        return true if safe_version[0] > detected_version[0] && safe_version[1] == 'x'
        return true if safe_version[1] > detected_version[1]
        return false if safe_version[1] <= detected_version[1]
      end

      def is_same_version?(safe_version_array, detected_version_array)
        ret = false

        ret = true if (safe_version_array[0] == detected_version_array[0]) if (safe_version_array[1] == 'x')
        ret = true if (safe_version_array[0] == detected_version_array[0]) && (safe_version_array[1] == detected_version_array[1]) && (safe_version_array.count == 2) && (detected_version_array.count == 2)
        ret = true if (safe_version_array[0] == detected_version_array[0]) && (safe_version_array[1] == detected_version_array[1]) && (safe_version_array[2] == detected_version_array[2]) && (safe_version_array.count == 3) && (detected_version_array.count == 3)
        ret = true if (safe_version_array[0] == detected_version_array[0]) && (safe_version_array[1] == detected_version_array[1]) && (safe_version_array[2] == detected_version_array[2]) && (safe_version_array[3] == detected_version_array[3]) && (safe_version_array.count == 4) && (detected_version_array.count == 4)

        debug_me "is_same_version? SVA=#{safe_version_array} DVA=#{detected_version_array} RET=#{ret}"

        return ret
      end
      #########################
      # Beta version handling
      #
      #########################

      def is_beta_check?(safe_version_beta, detected_version_beta)
        ( safe_version_beta != 0 || detected_version_beta != 0)
      end

      def is_vulnerable_beta?(safe_version_beta, detected_version_beta)
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
        # if the safe_version_rc is 0 then the detected_version_rc is
        # vulnerable by design, since the safe version is a stable and we
        # detected a rc.
        debug_me "entering is_vulnerable_rc?: s=#{safe_version_rc}, d=#{detected_version_rc}"
        return true if safe_version_rc == 0 && detected_version_rc != 0
        return false if safe_version_rc != 0 && detected_version_rc == 0
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

        safe_version_array << 0 if safe_version_array.count == 2
        detected_version_array << 0 if detected_version_array.count == 2

        major = is_vulnerable_major?(safe_version_array, detected_version_array)
        minor = is_vulnerable_minor?(safe_version_array, detected_version_array)
        patch = is_vulnerable_patch?(safe_version_array, detected_version_array)
        aux_patch = is_vulnerable_aux_patch?(safe_version_array, detected_version_array)

        debug_me "is_vulnerable_version? S=#{safe_version},D=#{detected_version} -> MAJOR=#{major} MINOR=#{minor} PATCH=#{patch} AUX_PATCH=#{aux_patch} SAVE_MINOR=#{@save_minor_fix} SAVE_MAJOR=#{@save_major_fix}"

        return is_vulnerable_beta?(sva[:beta], dva[:beta]) if is_same_version?(safe_version_array, detected_version_array) && is_beta_check?(sva[:beta], dva[:beta])
        return is_vulnerable_rc?(sva[:rc], dva[:rc]) if is_same_version?(safe_version_array, detected_version_array) && is_rc_check?(sva[:rc], dva[:rc])
        return is_vulnerable_pre?(sva[:pre], dva[:pre]) if is_same_version?(safe_version_array, detected_version_array) && is_pre_check?(sva[:pre], dva[:pre])

        # we have a non vulnerable major, but the minor is and there is an higher version in array
        # eg. we detected v1.3.2, safe version is 1.3.3 and there is also a safe 2.x.x
        return debug_me_and_return_false("#{detected_version} has a major version vulnerable but honoring save_major_fix") if major && @save_major_fix
        return debug_me_and_return_false("#{detected_version} has a minor version vulnerable but honoring save_minor_fix") if minor && @save_minor_fix
        return true if major && minor
        return true if ! major && minor && patch && ! @save_major_fix && ! @save_minor_fix
        return true if major && !@save_major_fix
        return true if !major && minor && @save_major_fix
        return patch if is_same_major?(safe_version_array, detected_version_array) && is_same_minor?(safe_version_array, detected_version_array) && !aux_patch
        return aux_patch if is_same_major?(safe_version_array, detected_version_array) && is_same_minor?(safe_version_array, detected_version_array) && is_same_patch?(safe_version_array, detected_version_array)
        return true if is_same_major?(safe_version_array, detected_version_array) && is_same_minor?(safe_version_array, detected_version_array) && patch && aux_patch
        return true if is_same_major?(safe_version_array, detected_version_array) && minor

        return false
      end

      def is_excluded?(detected_version)
        return false if detected_version.nil?
        return false if @excluded.nil?
        @excluded.each do |exc|
          exc_v = version_string_to_array(exc)[:version]
          det_v = version_string_to_array(detected_version)[:version]
          return true if is_same_version?(exc_v, det_v)
        end
        return false
      end
      def is_deprecated?(detected_version)
        return false if detected_version.nil?
        return false if @deprecated.nil?
        @deprecated.each do |dep|
          dep_v = version_string_to_array(dep)[:version]
          det_v = version_string_to_array(detected_version)[:version]
          return true if is_same_version?(dep_v, det_v)
          if dep_v[0] == 'x'
            # deprecation version is something like 'x.0.0'. This is a
            # nonsense since it means all versions are deprecated. However
            # I'll support also nonsense checks.

            $logger.warn "Setting the predicate #{dep} will mark all versions as deprecated" unless self.enable_warning.nil?
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
        {:version=>ver, :beta=>beta, :rc=>rc, :pre=>pre}
      end

    end
  end
end
