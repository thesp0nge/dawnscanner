module Codesake
  module Dawn
    module Kb
      module DependencyCheck
        include BasicCheck

        attr_accessor :dependencies

        # This attribute replaces fixed_dependency in 20130521. 
        # There are cve checks like
        # http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0175 that
        # addresses two different gems firing up the vulnerability. You can
        # read this like, "if you use gem A version A1 or if you use gem B
        # version B1 you can occur in this issue".
        attr_accessor :safe_dependencies
        attr_accessor :aux_mitigation_gem

        attr_accessor :not_affected

        def vuln?
          ret         = false
          @mitigated  = false
          message     = ""

          @dependencies.each do |dep|
            # don't care about gem version when it mitigates a vulnerability... this can be risky, maybe I would reconsider in the future.
            @mitigated = true if dep[:name] == @aux_mitigation_gem[:name] unless @aux_mitigation_gem.nil?

            @safe_dependencies.each do |safe_dep|
              if safe_dep[:name] == "rails"
                debug_me "Forcing save_minor_fixes flag for rails gem dependency check"
                self.save_minor_fixes = true
              end
              if @ruby_vulnerable_versions.empty?
                if dep[:name] == safe_dep[:name] && is_vulnerable_version?(dep[:version], safe_dep[:version]) 
                  ret = true
                  message = "Vulnerable #{dep[:name]} gem version found: #{dep[:version]}"
                end
              else
                if dep[:name] == safe_dep[:name] && is_vulnerable_version?(dep[:version], safe_dep[:version]) && is_ruby_vulnerable_version?
                  ret = true
                  message = "Vulnerable #{dep[:name]} gem version found: #{dep[:version]}"
                end
              end
            end

          end

          if ret and @mitigated 
            ret = false
            message += "Vulnerability has been mitigated by gem #{@aux_mitigation_gem[:name]}. Don't remove it from your Gemfile"
          end

          self.evidences << message unless message.empty?

          @status = ret

          ret
        end
      end
    end
  end
end
