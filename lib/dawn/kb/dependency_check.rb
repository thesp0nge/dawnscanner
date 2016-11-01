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

      # Tells a version is not vulnerable even if in the fixes array that has
      # a minor version number higher than the current.
      # This is useful especially for rails version where 3.0.x, 3.1.y, 3.2.z
      # are separated branches and the patch is provided for all of those. So
      # if version 3.1.10 is safe and you have it, you don't be prompted
      # about 3.2.x.
      attr_accessor :save_minor
      attr_accessor :save_major

      def initialize(options)
        super(options)
        @save_minor ||= options[:save_minor]
        @save_major ||= options[:save_major]
      end

      def vuln?
        ret         = false
        @mitigated  = false
        message     = ""


        @dependencies.each do |dep|
          # don't care about gem version when it mitigates a vulnerability... this can be risky, maybe I would reconsider in the future.
          @mitigated = true if dep[:name] == @aux_mitigation_gem[:name] unless @aux_mitigation_gem.nil?

          @safe_dependencies.each do |safe_dep|

            if dep[:name] == safe_dep[:name]
              v = Dawn::Kb::VersionCheck.new(
                {
                  :safe=>safe_dep[:version],
                  :detected=>dep[:version],
                  :save_minor => self.save_minor,
                  :save_major => self.save_major,
                }
              )
              v.debug = self.debug
              v.excluded = self.not_affected[:version] unless self.not_affected.nil?

              vuln = v.vuln?
              if vuln && @ruby_vulnerable_versions.empty?
                message = "Vulnerable #{dep[:name]} gem version found: #{dep[:version]}"
                ret = vuln
              end
            end
          end
        end

        if ret && @mitigated
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
