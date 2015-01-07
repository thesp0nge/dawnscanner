module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-21
			class CVE_2013_0285
				include DependencyCheck

				def initialize
          message= "The nori gem 2.0.x before 2.0.2, 1.1.x before 1.1.4, and 1.0.x before 1.0.3 for Ruby does not properly restrict casts of string values, which allows remote attackers to conduct object-injection attacks and execute arbitrary code, or cause a denial of service (memory and CPU consumption) involving nested XML entity references, by leveraging Action Pack support for (1) YAML type conversion or (2) Symbol type conversion, a similar vulnerability to CVE-2013-0156."
           super({
            :name=>"CVE-2013-0285",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 4, 9),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade nori gem to version 2.0.2, 1.1.4, 1.0.3 or latest version available",
            :aux_links=>["https://support.cloud.engineyard.com/entries/22915701-january-14-2013-security-vulnerabilities-httparty-extlib-crack-nori-update-these-gems-immediately"]
          })

          self.safe_dependencies = [{:name=>"nori", :version=>['1.0.3', '1.1.4', '2.0.2']}]

				end
			end
		end
	end
end
