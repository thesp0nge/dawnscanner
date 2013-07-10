module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-07-09
			class CVE_2011_0446
				include DependencyCheck

				def initialize
          message = "Multiple cross-site scripting (XSS) vulnerabilities in the mail_to helper in Ruby on Rails before 2.3.11, and 3.x before 3.0.4, when javascript encoding is used, allow remote attackers to inject arbitrary web script or HTML via a crafted (1) name or (2) email value. Please note that victim must voluntarily interact with attack mechanism"

          super({
            :name=>"CVE-2011-0446",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2011, 2, 14),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.11 or 3.0.4 or higher. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://groups.google.com/group/rubyonrails-security/msg/365b8a23b76a6b4a?dmode=source&output=gplain"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.12', '3.0.5']}]

				end
			end
		end
	end
end
