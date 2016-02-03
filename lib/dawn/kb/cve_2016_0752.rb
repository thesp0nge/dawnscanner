module Dawn
		module Kb
			# Automatically created with rake on 2016-01-31
			class CVE_2016_0752
				# Include the testing skeleton for this CVE
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          message = "There is a possible directory traversal and information leak vulnerability in Action View. Applications that pass unverified user input to the render method in a controller may be vulnerable to an information leak vulnerability."
          super({
            :title=>title,
            :name=> "CVE-2016-0752",
            :cve=>"2016-0752",
            :osvdb=>"",
            :cvss=>"",
            :release_date => Date.new(2016, 1, 26),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade actionview gem to version 3.2.22.1, 4.1.14.1, 4.2.5.1, 5.0.0.beta1.1 or later.",
            :aux_links=>["http://securitytracker.com/id/1034816"]
           })
          self.save_minor=true
          self.save_major=true
          self.safe_dependencies = [{:name=>"actionview", :version=>['3.2.22.1', '4.1.14.1', '4.2.5.1', '5.0.0.beta1.1']}]


				end
			end
		end
end
