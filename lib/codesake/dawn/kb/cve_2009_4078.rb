module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2009_4078
				include DependencyCheck

				def initialize
          message = "Multiple cross-site scripting (XSS) vulnerabilities in Redmine 0.8.5 and earlier allow remote attackers to inject arbitrary web script or HTML via unspecified vectors."
           super({
            :name=>"CVE-2009-4078",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N", 
            :release_date => Date.new(2009, 11, 25),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade redmine version at least to 0.8.6 or higher. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://www.redmine.org/wiki/redmine/Changelog#v086-2009-11-04"]
          })

          self.safe_dependencies = [
            {:name=>"redmine", :version=>['0.8.5', '0.7.999', '0.6.999', '0.5.999', '0.4.999', '0.3.999', '0.2.999', '0.1.999']}
          ]

				end
			end
		end
	end
end
