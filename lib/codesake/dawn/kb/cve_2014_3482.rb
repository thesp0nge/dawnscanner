module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-07-04
			class CVE_2014_3482
				include DependencyCheck

				def initialize
          message = "Ruby on Rails contains a flaw that may allow carrying out an SQL injection attack. The issue is due to the PostgreSQL adapter for Active Record not properly sanitizing user-supplied input when quoting bitstrings. This may allow a remote attacker to inject or manipulate SQL queries in the back-end database, allowing for the manipulation or disclosure of arbitrary data."
           super({
            :name=> "CVE-2014-3482",
            :cve=>"CVE-2014-3482",
            :osvdb=>"108664",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2014, 7, 2),
            :cwe=>"",
            :owasp=>"A1",
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.2.19. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2014/7/2/Rails_3_2_19_4_0_7_and_4_1_3_have_been_released/"]
           })
           self.safe_dependencies = [{:name=>"rails", :version=>['3.2.19']}]

				end
			end
		end
	end
end
