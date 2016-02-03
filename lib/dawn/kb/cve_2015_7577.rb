module Dawn
		module Kb
			# Automatically created with rake on 2016-01-29
			class CVE_2015_7577
				# Include the testing skeleton for this CVE
				include DependencyCheck

				def initialize
          message = "There is a vulnerability in how the nested attributes feature in Active Record handles updates in combination with destroy flags when destroying records is disabled."
          super({
            :title=>title,
            :name=> "CVE-2015-7577",
            :cve=>"2015-7577",
            :osvdb=>"",
            :cvss=>"",
            :release_date => Date.new(2016, 1, 26),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade activerecord gem to version 3.2.22.1, 4.1.14.1, 4.2.5.1, 5.0.0.beta1.1 or later.",
            :aux_links=>["http://securitytracker.com/id/1034816"]
           })
          self.save_minor=true
          self.save_major=true
          self.safe_dependencies = [{:name=>"activerecord", :version=>['3.2.22.1', '4.1.14.1', '4.2.5.1', '5.0.0.beta1.1']}]

				end
			end
		end
end
