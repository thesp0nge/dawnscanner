module Dawn
		module Kb
			# Automatically created with rake on 2016-03-01
			class CVE_2016_2097
				# Include the testing skeleton for this CVE
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
         message = "Possible Information Leak Vulnerability in Action View. There is a possible directory traversal and information leak vulnerability in Action View. This was meant to be fixed on CVE-2016-0752. However the 3.2 patch was not covering all the scenarios."
          title = "Possible Information Leak Vulnerability in Action View"
          super({
            :title=>title,
            :name=> "CVE-2016-2097",
            :cve=>"2016-2097",
            :osvdb=>"",
            :cvss=>"",
            :release_date => Date.new(2016, 2, 29),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade actionview gem to version 3.2.22.2, 4.1.14.2 or later.",
            :aux_links=>[]
           })
          self.safe_dependencies = [{:name=>"actionview", :version=>['3.2.22.2', '4.0.99', '4.1.14.2', '5.0.0']}]
          self.save_minor = true
          self.save_major = true
 
				end
			end
		end
end
