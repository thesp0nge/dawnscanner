module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-07
			class CVE_2006_6979
				include DependencyCheck

				def initialize
          message = "The ruby handlers in the Magnatune component in Amarok do not properly quote text in certain contexts, probably including construction of an unzip command line, which allows attackers to execute arbitrary commands via shell metacharacters."

          super({
            :name=>"CVE-2006-6979",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2007, 2, 8),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"It seems there is no real workaround but not using amarok in your project. If it's needed, please sanitize your code before passing input to Magnatune component",
            :aux_links=>["http://www.securityfocus.com/bid/22568"]
          })

          self.safe_dependencies = [{:name=>"amarok", :version=>['999.999.999']}]


				end
			end
		end
	end
end
