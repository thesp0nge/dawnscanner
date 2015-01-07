module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-06
			class CVE_2013_2516
				include DependencyCheck

				def initialize
          message = "fileutils Gem for Ruby contains a flaw in file_utils.rb. The issue is triggered when handling a specially crafted URL containing a command after a delimiter (;). This may allow a remote attacker to potentially execute arbitrary commands."
          super({
            :name=>"CVE-2013-2516",
            :cvss=>"",
            :release_date => Date.new(2013, 2, 28),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"At the time of writing this, there is no solution to this vulnerability by software upgrade since latest version is still 0.7. You may want to sanitize your input before passing to offendend library.",
            :aux_links=>["http://packetstormsecurity.com/files/120579/Fileutils-Ruby-Gem-Remote-Command-Execution.html"]
          })
          self.safe_dependencies = [{:name=>"fileutils", :version=>['0.8']}]

				end
			end
		end
	end
end
