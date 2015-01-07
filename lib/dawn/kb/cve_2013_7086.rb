module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-10
			class CVE_2013_7086
				include DependencyCheck

				def initialize
          message = "The message function in lib/webbynode/notify.rb in the Webbynode gem 1.0.5.3 and earlier for Ruby allows context-dependent attackers to execute arbitrary commands via shell metacharacters in a growlnotify message."
          super({
            :name=>"CVE-2013-7086",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 12, 19),
            :cwe=>"94",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade webbynode up to version 1.0.5.3",
            :aux_links=>["http://xforce.iss.net/xforce/xfdb/89705"]
          })

          self.safe_dependencies = [{:name=>"webbynode", :version=>['1.0.5.4']}]

				end
			end
		end
	end
end
