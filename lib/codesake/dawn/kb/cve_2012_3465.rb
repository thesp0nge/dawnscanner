module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-13
			class CVE_2012_3465
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in actionpack/lib/action_view/helpers/sanitize_helper.rb in the strip_tags helper in Ruby on Rails before 3.0.17, 3.1.x before 3.1.8, and 3.2.x before 3.2.8 allows remote attackers to inject arbitrary web script or HTML via malformed HTML markup."
          super({
            :name=>"CVE-2012-3465",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2012, 8, 10),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.13, 3.0.10, 3.1.0. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/d/topic/rubyonrails-security/FgVEtBajcTY/discussion"]
          })
          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.14', '3.0.17', '3.1.8', '3.2.8']}]

				end
			end
		end
	end
end
