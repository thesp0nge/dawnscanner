module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-07
			class CVE_2013_2513
				include DependencyCheck

				def initialize
          message = "flash_tool Gem for Ruby contains a flaw that is triggered during the handling of downloaded files that contain shell characters. With a specially crafted file, a context-dependent attacker can execute arbitrary commands."
          super({
            :name=>"CVE-2013-2513",
            :cvss=>"",
            :release_date => Date.new(2013, 3, 4),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"At the time of writing this, there is no solution to this vulnerability by software upgrade since latest version is still 0.6.0. You may want to sanitize your input before passing to offendend library.",
            :aux_links=>["http://packetstormsecurity.com/files/120626/Flash-Tool-0.6.0-Remote-Code-Execution.html"]
          })
          self.safe_dependencies = [{:name=>"flash_tool", :version=>['0.6.1']}]
				end
			end
		end
	end
end
