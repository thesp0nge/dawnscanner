module Codesake
	module Dawn
		module Kb

      class CVE_2011_0995_a

        include DependencyCheck

				def initialize
          message = "CVE-2011:0995: sqlite3 gem version 1.2.4 is vulnerable"

          super({
            :name=>"CVE-2011-0995_a",
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
          })

          self.safe_dependencies = [{:name=>"sqlite3", :version=>['1.2.4']}]
				end
      end

      class CVE_2011_0995_b
        include OperatingSystemCheck

				def initialize
          message = "CVE-2011-0995: sqlite3 gem is vulnerable only in SuSE 11 sp1"

          super({
            :name=>"CVE-2011-0995_b",
            :kind=>Codesake::Dawn::KnowledgeBase::OS_CHECK,
          })

          self.safe_os = [{:family=>"linux", :vendor=>"suse", :version=>['11sp2']}]

				end
      end

			# Automatically created with rake on 2013-07-10
			class CVE_2011_0995
				include ComboCheck

				def initialize
          message = "The sqlite3-ruby gem in the rubygem-sqlite3 package before 1.2.4-0.5.1 in SUSE Linux Enterprise (SLE) 11 SP1 uses weak permissions for unspecified files, which allows local users to gain privileges via unknown vectors."

          super({
            :name=>"CVE-2011-0995",
            :cvss=>"AV:L/AC:L/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2011, 5, 13),
            :cwe=>"264",
            :owasp=>"A9", 
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::COMBO_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.15, 3.2.5, 3.1.5 or 3.0.13. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://support.novell.com/security/cve/CVE-2011-0995.html"],
            :checks=>[CVE_2011_0995_a.new, CVE_2011_0995_b.new]
          })


				end
			end
		end
	end
end
