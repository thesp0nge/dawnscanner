module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-06
			class CVE_2012_2695
				include DependencyCheck

				def initialize
          message = "The Active Record component in Ruby on Rails before 3.0.14, 3.1.x before 3.1.6, and 3.2.x before 3.2.6 does not properly implement the passing of request data to a where method in an ActiveRecord class, which allows remote attackers to conduct certain SQL injection attacks via nested query parameters that leverage improper handling of nested hashes, a related issue to CVE-2012-2661."

          super({
            :name=>"CVE-2012-2695",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2012, 6, 22),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.2.6, 3.1.6 or 3.0.14. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/d/topic/rubyonrails-security/l4L0TEVAz1k/discussion"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.0.14', '3.2.6', '3.1.6']}]
				end
			end
		end
	end
end
