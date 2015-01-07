module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-07-12
			class CVE_2012_3424
				include DependencyCheck

				def initialize
          message = "The decode_credentials method in actionpack/lib/action_controller/metal/http_authentication.rb in Ruby on Rails 3.x before 3.0.16, 3.1.x before 3.1.7, and 3.2.x before 3.2.7 converts Digest Authentication strings to symbols, which allows remote attackers to cause a denial of service by leveraging access to an application that uses a with_http_digest helper method, as demonstrated by the authenticate_or_request_with_http_digest method."

           super({
            :name=>"CVE-2012-3424",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2012, 8, 8),
            :cwe=>"287",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.0.16, 3.1.7 or 3.2.7. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/group/rubyonrails-security/msg/244d32f2fa25147d?hl=en&dmode=source&output=gplain"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.0.16', '3.1.7', '3.2.7']}]


				end
			end
		end
	end
end
