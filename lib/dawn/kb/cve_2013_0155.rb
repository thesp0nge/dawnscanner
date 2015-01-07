module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-10
			class CVE_2013_0155
				include DependencyCheck

				def initialize
          message = "Ruby on Rails 3.0.x before 3.0.19, 3.1.x before 3.1.10, and 3.2.x before 3.2.11 does not properly consider differences in parameter handling between the Active Record component and the JSON implementation, which allows remote attackers to bypass intended database-query restrictions and perform NULL checks or trigger missing WHERE clauses via a crafted request, as demonstrated by certain \"[nil]\" values, a related issue to CVE-2012-2660 and CVE-2012-2694."

          super({
            :name=>"CVE-2013-0155",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:N",
            :release_date => Date.new(2013, 1, 13),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.0.19, 3.1.10 and 3.2.11. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/d/topic/rubyonrails-security/c7jT-EeN9eI/discussion"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.0.19', '3.1.10', '3.2.11']}]


				end
			end
		end
	end
end
