module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-21
			class CVE_2013_1801
				include DependencyCheck

				def initialize
          message = "The httparty gem 0.9.0 and earlier for Ruby does not properly restrict casts of string values, which might allow remote attackers to conduct object-injection attacks and execute arbitrary code, or cause a denial of service (memory and CPU consumption) by leveraging Action Pack support for YAML type conversion, a similar vulnerability to CVE-2013-0156."
           super({
            :name=>"CVE-2013-1801",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 4, 9),
            :cwe=>"264",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade httparty gem to version 0.9.0 or latest version available",
            :aux_links=>["https://support.cloud.engineyard.com/entries/22915701-january-14-2013-security-vulnerabilities-httparty-extlib-crack-nori-update-these-gems-immediately"]
          })

          self.safe_dependencies = [{:name=>"httparty", :version=>['0.9.0']}]

				end
			end
		end
	end
end
