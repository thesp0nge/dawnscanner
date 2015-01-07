module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-07
			class CVE_2013_2512
				include DependencyCheck

				def initialize
          message = "ftpd Gem for Ruby contains a flaw that is triggered when handling a specially crafted option or filename that contains a shell character. This may allow a remote attacker to inject arbitrary commands"
          
          super({
            :name=>"CVE-2013-2512",
            :cvss=>"",
            :release_date => Date.new(2013, 2, 28),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"To mitigate this vulnerability you must upgrade ftpd gem version to 0.2.2 or higher.",
            :aux_links=>["http://packetstormsecurity.com/files/120618/Ruby-Gem-ftpd-0.2.1-Remote-Command-Execution.html"]
          })
          self.safe_dependencies = [{:name=>"ftpd", :version=>['0.2.2']}]
				end
			end
		end
	end
end
