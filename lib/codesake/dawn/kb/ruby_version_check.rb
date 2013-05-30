module Codesake
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


          @safe_rubies.each do |ss|
            vv_e << ss[:engine]
            vv_a << ss[:version]
            vv_p << ss[:patchlevel].split("p")[1].to_i
          end
          vengine = self.is_vulnerable_engine?(detected_ruby[:engine], vv_e)
          vv = self.is_vulnerable_version?(detected_ruby[:version], vv_a)

          # Since we have also the patch level a fixes version can be the same
          # as the vulnerable... we must consider this
          ve = self.is_same_version?(detected_ruby[:version], vv_a) unless vv
          vp = is_vulnerable_patchlevel?(detected_ruby[:patchlevel], vv_p) if ve

          return true if ( vv and vengine )
          return (ve and vp and vengine )
        end
        
        def is_vulnerable_engine?(target, fixes = [])
          fixes.each do |f|
            return true if f == target
          end
        end

        def is_same_version?(target, fixes = [])
          fixes.each do |f|
            return true if f == target
          end
          false
        end

        def is_vulnerable_patchlevel?(target, fixes = [])
          t = target.split("p")[1].to_i
          fixes.each do |f|
            return true if f > t
          end
          false
        end
      end
    end
  end
end

