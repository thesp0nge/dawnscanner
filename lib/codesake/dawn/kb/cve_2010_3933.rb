module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-08
			class CVE_2010_3933
				include DependencyCheck

				def initialize
          message = "Ruby on Rails 2.3.9 and 3.0.0 does not properly handle nested attributes, which allows remote attackers to modify arbitrary records by changing the names of parameters for form inputs."
          super({
            :name=>"CVE-2010-3933",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2010, 10, 28),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.10, 3.0.1 or higher. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["ttp://weblog.rubyonrails.org/2010/10/15/security-vulnerability-in-nested-attributes-code-in-ruby-on-rails-2-3-9-and-3-0-0"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.10', '3.0.1']}]

				end
			end
		end
	end
end
