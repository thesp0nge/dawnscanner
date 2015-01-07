module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-07-12
			class CVE_2011_2929
				include DependencyCheck

				def initialize
          message = "The template selection functionality in actionpack/lib/action_view/template/resolver.rb in Ruby on Rails 3.0.x before 3.0.10 and 3.1.x before 3.1.0.rc6 does not properly handle glob characters, which allows remote attackers to render arbitrary views via a crafted URL, related to a \"filter skipping vulnerability.\""
          super({
            :name=>"CVE-2011-2929",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2011, 8, 29),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.1.0 or 3.0.10. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://github.com/rails/rails/commit/5f94b93279f6d0682fafb237c301302c107a9552"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.1.0', '3.0.10']}]

				end
			end
		end
	end
end
