module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-30
			class CVE_2012_1099
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in actionpack/lib/action_view/helpers/form_options_helper.rb in the select helper in Ruby on Rails 3.0.x before 3.0.12, 3.1.x before 3.1.4, and 3.2.x before 3.2.2 allows remote attackers to inject arbitrary web script or HTML via vectors involving certain generation of OPTION elements within SELECT elements."
          super({
            :name=>"CVE-2012-1099",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2012, 3, 13),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.0.12, 3.1.4 and 3.2.2. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2012/3/1/ann-rails-3-0-12-has-been-released"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.0.12', '3.1.4', '3.2.2']}]

				end
			end
		end
	end
end
