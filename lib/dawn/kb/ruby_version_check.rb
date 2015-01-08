module Dawn
  module Kb
    module RubyVersionCheck
      include BasicCheck
      # Array of hashes in the {:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p342"} form
      attr_accessor   :safe_rubies
      # Hash in the {:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p342"} form
      attr_accessor   :detected_ruby

      def vuln?
        vv_a = []
        vv_p = []
        vv_e = []
        vp = false
        ve = false


        @safe_rubies.each do |ss|
          vv_e << ss[:engine]
          vv_a << ss[:version]
          vv_p << ss[:patchlevel].split("p")[1].to_i
        end

        version_check = Dawn::Kb::VersionCheck.new(:safe=>vv_a,:detected=>detected_ruby[:version], :debug=>@debug, :save_major=>true)

        vengine = self.is_vulnerable_engine?(detected_ruby[:engine], vv_e)
        vv = version_check.vuln?

        ve = self.is_same_version?(detected_ruby[:version], vv_a)
        vp = is_vulnerable_patchlevel?(detected_ruby[:version], detected_ruby[:patchlevel])

        debug_me("#{__FILE__}@#{__LINE__}: check: #{self.name}, engine is vulnerable?=#{vengine}, version is vulnerable?=#{vv}, is same version?=#{ve}, is_vulnerable_patchlevel?=#{vp}->#{vv && vengine}, #{(ve && vp && vengine )}")
        debug_me("#{__FILE__}@#{__LINE__}: safe ruby is: #{@safe_rubies}")
        debug_me("#{__FILE__}@#{__LINE__}: detected ruby is: #{@detected_ruby}")



        if ( vv && vengine)
          @status = vp if ve
          @status = true unless ve
        else
          @status = (ve && vp && vengine )
        end

        debug_me("STATUS:#{@status}")
        self.evidences << "#{@detected_ruby[:engine]} v#{@detected_ruby[:version]}-#{@detected_ruby[:patchlevel]} detected" if @status
        return @status

        # return true if ( vv && vengine )
        # return (ve && vp && vengine )
      end
      def is_vulnerable_engine?(target, fixes = [])
        fixes.each do |f|
          return true if f == target
        end
        false
      end

      def is_same_version?(target, fixes = [])
        fixes.each do |f|
          debug_me("F=#{f}, TARGET=#{target}")
          return true if f == target
        end
        false
      end

      def is_vulnerable_patchlevel?(version, patchlevel)
        fixes = []
        debug_me "is_vulnerable_patchlevel? called with VERSION=#{version} and PLEVEL=#{patchlevel}"
        @safe_rubies.each do |ss|
          fixes << ss[:patchlevel].split("p")[1].to_i if ss[:version] == version
        end

        debug_me "FIXES IS EMPTY" if fixes.empty?
        debug_me "FIXES LIST IS #{fixes}" unless fixes.empty?
        return true if fixes.empty?

        t = patchlevel.split("p")[1].to_i if patchlevel.include? 'p'
        t = patchlevel.to_i unless patchlevel.include? 'p'
        fixes.each do |f|
          debug_me "PATCHLEVEL FIXES = #{f}, PATCHLEVEL TARGET = #{t}"
          return true if f > t
        end
        false
      end
    end
  end
end
