module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-30
			class CVE_2012_3464
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in activesupport/lib/active_support/core_ext/string/output_safety.rb in Ruby on Rails before 3.0.17, 3.1.x before 3.1.8, and 3.2.x before 3.2.8 might allow remote attackers to inject arbitrary web script or HTML via vectors involving a ' (quote) character."
          super({
            :name=>"CVE-2012-3464",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2012, 8, 10),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.0.17, 3.1.8 or 3.2.8. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/group/rubyonrails-security/msg/8f1bbe1cef8c6caf?dmode=source&output=gplain"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.0.17', '3.1.8', '3.2.8']}]

				end
			end
		end
	end
end
