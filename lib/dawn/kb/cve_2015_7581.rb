module Dawn
		module Kb
			# Automatically created with rake on 2016-02-01
			class CVE_2015_7581
				# Include the testing skeleton for this CVE
				include DependencyCheck

				def initialize
          message = "There is an object leak vulnerability for wildcard controllers in Action Pack. Users that have a route that contains the string \":controller\" are susceptible to objects being leaked globally which can lead to unbounded memory growth. "
            super({
            :title=>title,
            :name=> "CVE-2015-7581",
            :cve=>"2015-7581",
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
