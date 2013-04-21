module Codesake
  module Dawn
    module Kb
      class CVE_2013_1855 < PatternMatchCheck

        def initialize
          options = { :fixes_version => ['2.3.18', '3.2.13', '3.1.12'], :attack_pattern => "sanitize_css", :name=>'CVE-2013-1855'}
          super(options)
        end
      end
    end
  end
end
