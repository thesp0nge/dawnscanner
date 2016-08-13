module Dawn
		module Kb
			# Automatically created with rake on 2016-03-01
			class CVE_2016_2098
				# Include the testing skeleton for this CVE
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          message = "There is a possible remote code execution vulnerability in Action Pack. Applications that pass unverified user input to the render method in a
controller or a view may be vulnerable to a code injection."
          title = "Possible remote code execution vulnerability in Action Pack"
          super({
            :title=>title,
            :name=> "CVE-2016-2098",
            :cve=>"2016-2098",
            :osvdb=>"",
            :cvss=>"",
            :release_date => Date.new(2016, 2, 29),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade actionpack gem to version 3.2.22.2, 4.1.14.2, 4.2.5.2, 5.0.0 or later.",
            :aux_links=>['https://groups.google.com/forum/message/raw?msg=rubyonrails-security/ly-IH-fxr_Q/WLoOhcMZIAAJ']
           })
          self.safe_dependencies = [{:name=>"actionpack", :version=>['3.2.22.2', '4.0.9999', '4.1.14.2', '4.2.5.2']}]
          self.not_affected = {:name=>"actionpack", :version=>['5.0.x']}

				end
			end
		end
end
