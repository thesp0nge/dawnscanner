module Dawn
		module Kb
			# Automatically created with rake on 2016-01-28
			class CVE_2015_7576
				# Include the testing skeleton for this CVE
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          message = "There is a timing attack vulnerability in the basic authentication support in Action Controller. Due to the way that Action Controller compares user names and passwords in basic authentication authorization code, it is possible for an attacker to analyze the time taken by a response and intuit the password."
          super({
            :title=>title,
            :name=> "CVE-2015-7576",
            :cve=>"2015-7576",
            :osvdb=>"",
            :cvss=>"",
            :release_date => Date.new(2016, 1, 26),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade actionpack gem to version 3.2.22.1, 4.1.14.1, 4.2.5.1, 5.0.0.beta1.1 or later.",
            :aux_links=>["http://securitytracker.com/id/1034816"]
           })
          self.save_minor=true
          self.save_major=true
          self.safe_dependencies = [{:name=>"actionpack", :version=>['3.2.22.1', '4.1.14.1', '4.2.5.1', '5.0.0.beta1.1']}]


				end
			end
		end
end
