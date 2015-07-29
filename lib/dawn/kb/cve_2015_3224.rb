module Dawn
		module Kb
			# Automatically created with rake on 2015-07-29
			class CVE_2015_3224
				include DependencyCheck

				def initialize
          message = "request.rb in Web Console before 2.1.3, as used with Ruby on Rails 3.x and 4.x, does not properly restrict the use of X-Forwarded-For headers in determining a client's IP address, which allows remote attackers to bypass the whitelisted_ips protection mechanism via a crafted request."
           super({
            :name=>"CVE-2015-3224",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2015, 7, 26),
            :cwe=>"284",
            :owasp=>"A9",
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade web-console gem to latest version.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=rubyonrails-security/lzmz9_ijUFw/HBMPi4zp5NAJ"]
           })

           self.safe_dependencies = [{:name=>"web-console", :version=>['2.1.3']}]
				end
			end
		end
end
