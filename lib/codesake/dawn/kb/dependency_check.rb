module Codesake
  module Dawn
    module Kb
      module DependencyCheck
        include BasicCheck

        attr_accessor :dependencies
        attr_accessor :fixed_dependency
        attr_accessor :aux_mitigation_gem


        def vuln?
          ret         = false
          @mitigated  = false
          message     = ""

          @dependencies.each do |dep|
            # don't care about gem version when it mitigates a vulnerability... this can be risky, maybe I would reconsider in the future.
            @mitigated = true if dep[:name] == @aux_mitigation_gem[:name] unless @aux_mitigation_gem.nil?

            if @ruby_vulnerable_versions.empty?
              if dep[:name] == @fixed_dependency[:name] and is_vulnerable_version?(dep[:version], @fixed_dependency[:version]) 
                ret = true
                message = "Vulnerable #{dep[:name]} gem version found: #{dep[:version]}"
              end
            else
              if dep[:name] == @fixed_dependency[:name] and is_vulnerable_version?(dep[:version], @fixed_dependency[:version]) and is_ruby_vulnerable_version?
                ret = true
                message = "Vulnerable #{dep[:name]} gem version found: #{dep[:version]}"
              end
            end

          end

          if ret and @mitigated 
            ret = false
            message += "Vulnerability has been mitigated by gem #{@aux_mitigation_gem[:name]}. Don't remove it from your Gemfile"
          end

          self.evidences << message unless message.empty?

          ret
        end
      end
    end
  end
end
