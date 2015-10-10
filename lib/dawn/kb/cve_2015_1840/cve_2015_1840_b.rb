module Dawn
		module Kb
			# Automatically created with rake on 2015-07-29
			class CVE_2015_1840_b
				include DependencyCheck

				def initialize
          message = "jquery_ujs.js in jquery-rails before 3.1.3 and 4.x before 4.0.4 and rails.js in jquery-ujs before 1.0.4, as used with Ruby on Rails 3.x and 4.x, allow remote attackers to bypass the Same Origin Policy, and trigger transmission of a CSRF token to a different-domain web server, via a leading space character in a URL within an attribute value."

          super({
            :name=>"CVE-2015-1840",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2015, 7, 26),
            :cwe=>"200",
            :owasp=>"A8",
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade jquery-ujs and jquery-rails gems to latest version.",
            :aux_links=>["https://github.com/rails/jquery-rails/blob/master/CHANGELOG.md", "https://github.com/rails/jquery-ujs/blob/master/CHANGELOG.md"]
           })

          self.safe_dependencies = [{:name=>"jquery-ujs", :version=>['1.0.4']}]

				end
			end
		end
end
