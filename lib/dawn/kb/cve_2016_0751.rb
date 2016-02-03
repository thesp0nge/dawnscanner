module Dawn
		module Kb
			# Automatically created with rake on 2016-01-28
			class CVE_2016_0751
				# Include the testing skeleton for this CVE
				include DependencyCheck

				def initialize
          message = "There is a possible object leak which can lead to a denial of service vulnerability in Action Pack. A carefully crafted accept header can cause a global cache of mime types to grow indefinitely which can lead to a possible denial of service attack in Action Pack."
          super({
            :title=>title,
            :name=> "CVE-2016-0751",
            :cve=>"2016-0751",
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
          self.safe_dependencies = [{:name=>"actionpack", :version=>['3.2.22.1', '4.1.14.1', '4.2.5.1', '5.0.0.beta1.1']}]

				end
			end
		end
end
