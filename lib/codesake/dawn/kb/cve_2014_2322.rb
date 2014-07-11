module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-03-14
			class CVE_2014_2322
				# Include the testing skeleton for this CVE
				include DependencyCheck

				def initialize
          message = "Arabic Prawn Gem for Ruby contains a flaw in the ib/string_utf_support.rb file. The issue is due to the program failing to sanitize user input. This may allow a remote attacker to inject arbitrary commands."

           super({
            :name=>"CVE-2014-2322",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2014, 3, 10),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"At March, 14 2014 a fixed Arabic-Prawn release is not available. Please sanitize your input before passing it to this gem and upgrade to higher versions as soon as possible",
            :aux_links=>["http://packetstormsecurity.com/files/125679/Ruby-Gem-Arabic-Prawn-0.0.1-Command-Injection.html"]
           })

           self.safe_dependencies = [{:name=>"Arabic-Prawn", :version=>['0.0.2']}]
				end
			end
		end
	end
end
