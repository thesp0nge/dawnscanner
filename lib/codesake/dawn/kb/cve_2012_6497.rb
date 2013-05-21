module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-06
			class CVE_2012_6497
				include DependencyCheck

				def initialize
          message = "The Authlogic gem for Ruby on Rails, when used with certain versions before 3.2.10, makes potentially unsafe find_by_id method calls, which might allow remote attackers to conduct CVE-2012-6496 SQL injection attacks via a crafted parameter in environments that have a known secret_token value, as demonstrated by a value contained in secret_token.rb in an open-source product."

          super({
            :name=>"CVE-2012-6497",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2013, 1, 4),
            :cwe=>"200",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version to the latest stable rails version.",
            :aux_links=>["https://groups.google.com/d/topic/rubyonrails-security/DCNTNp_qjFM/discussion"]
          })

          self.safe_dependencies = [{:name=>"authlogic", :version=>['3.2.10']}]

				end
			end
		end
	end
end
