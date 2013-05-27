module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-27
			class CVE_2013_2617
				include DependencyCheck

				def initialize
          message = "lib/curl.rb in the Curl Gem for Ruby allows remote attackers to execute arbitrary commands via shell metacharacters in a URL."
          super({
            :name=>"CVE-2013-2617",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 3, 20),
            :cwe=>"94",
            :owasp=>"A9", 
            :applies=>["rails", "padrino", "sinatra"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please consider not using curl rubygem. The project seems to be abandoned and the vulnerability has not been fixed",
            :aux_links=>["http://seclists.org/fulldisclosure/2013/Mar/124"]
          })

          self.safe_dependencies = [{:name=>"curl", :version=>['99.99.99']}]


				end
			end
		end
	end
end
