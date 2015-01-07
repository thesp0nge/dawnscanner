module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-03
			class CVE_2012_2694
				include DependencyCheck

				def initialize
          message = "actionpack/lib/action_dispatch/http/request.rb in Ruby on Rails before 3.0.14, 3.1.x before 3.1.6, and 3.2.x before 3.2.6 does not properly consider differences in parameter handling between the Active Record component and the Rack interface, which allows remote attackers to bypass intended database-query restrictions and perform NULL checks via a crafted request, as demonstrated by certain \"['xyz', nil]\" values, a related issue to CVE-2012-2660."

          super({
            :name=>"CVE-2012-2694",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2012, 6, 22),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.15, 3.2.6, 3.1.6 or 3.0.14. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/d/topic/rubyonrails-security/l4L0TEVAz1k/discussion"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.15', '3.0.14', '3.2.6', '3.1.6']}]



				end
			end
		end
	end
end
