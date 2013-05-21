module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-10
			class CVE_2013_0269
				include DependencyCheck

				def initialize
          message = "The JSON gem before 1.5.5, 1.6.x before 1.6.8, and 1.7.x before 1.7.7 for Ruby allows remote attackers to cause a denial of service (resource consumption) or bypass the mass assignment protection mechanism via a crafted JSON document that triggers the creation of arbitrary Ruby symbols or certain internal objects, as demonstrated by conducting a SQL injection attack against Ruby on Rails, aka \"Unsafe Object Creation Vulnerability.\""

          super({
            :name=>"CVE-2013-0269",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 2, 13),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade JSON gem to version 1.5.5, 1.6.8 or 1.7.7 or latest version available",
            :aux_links=>["https://groups.google.com/d/topic/rubyonrails-security/4_YvCpLzL58/discussion"]
          })

          self.safe_dependencies = [{:name=>"json", :version=>['1.5.5', '1.6.8', '1.7.7']}]
				end
			end
		end
	end
end
