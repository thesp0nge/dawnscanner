module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-30
			class CVE_2012_3463
				include DependencyCheck

				def initialize
          message="Cross-site scripting (XSS) vulnerability in actionpack/lib/action_view/helpers/form_tag_helper.rb in Ruby on Rails 3.x before 3.0.17, 3.1.x before 3.1.8, and 3.2.x before 3.2.8 allows remote attackers to inject arbitrary web script or HTML via the prompt field to the select_tag helper."
          super({
            :name=>"CVE-2012-3463",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2012, 8, 10),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.0.17, 3.1.8 or 3.2.8. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/group/rubyonrails-security/msg/961e18e514527078?dmode=source&output=gplain"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.0.17', '3.1.8', '3.2.8']}]

				end
			end
		end
	end
end
