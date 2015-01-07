module Codesake
	module Dawn
		module Kb

      class CVE_2013_1655_a

				include DependencyCheck

        def initialize
          message = "CVE-2013-1655: puppet versions 2.7.21 and 3.1.1 are vulnerable"

          super({
            :name=>"CVE-2013-1655_a",
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
          })

          self.safe_dependencies = [{:name=>"puppet", :version=>['2.7.21', '3.1.1']}]
        end
      end

      class CVE_2013_1655_b

        include RubyVersionCheck

        def initialize
          message = "CVE-2013-1655: puppet versions 2.7.21 and 3.1.1 are vulnerable only when running ruby 1.9.3 and 2.0.2"

          super({
            :name=>"CVE-2013-1655_b",
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p357"},
            {:engine=>"ruby", :version=>"1.9.4", :patchlevel=>"p0"},
            {:engine=>"ruby", :version=>"2.0.1", :patchlevel=>"p0"}]
        end
      end

      class CVE_2013_1655

        include ComboCheck

        def initialize
          message = "Puppet 2.7.x before 2.7.21 and 3.1.x before 3.1.1, when
          running Ruby 1.9.3 or later, allows remote attackers to execute
          arbitrary code via vectors related to \"serialized attributes.\""

          super({
            :name=>"CVE-2013-1655",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 3, 20),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::COMBO_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade puppet gem to a newer version",
            :aux_links=>["https://puppetlabs.com/security/cve/cve-2013-1655/"],
            :checks=>[CVE_2013_1655_a.new, CVE_2013_1655_b.new]
          })

        end
      end
    end
  end
end
