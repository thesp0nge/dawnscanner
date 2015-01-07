module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-07
			class CVE_2006_2582
				include DependencyCheck

				def initialize
          message = "The editing form in RWiki 2.1.0pre1 through 2.1.0 allows remote attackers to execute arbitrary Ruby code via unknown attack vectors."
          super({
            :name=>"CVE-2006-2582",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2006, 5, 25),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rwiki to version 2.1.0 or above",
            :aux_links=>["http://secunia.com/advisories/20264"]
          })

          self.safe_dependencies = [{:name=>"rwiki", :version=>['2.1.0']}]


				end
			end
		end
	end
end
