module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-12-12
			class CVE_2013_6416
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in the simple_format helper in actionpack/lib/action_view/helpers/text_helper.rb in Ruby on Rails 4.x before 4.0.2 allows remote attackers to inject arbitrary web script or HTML via a crafted HTML attribute."

          super({
            :name=>"CVE-2013-6416",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N) ",
            :release_date => Date.new(2013, 12, 7),
            :cwe=>"79",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails to version 4.0.2. As a general rule, using the latest stable version is recommended. Versions 3.x are not affected",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=ruby-security-ann/5ZI1-H5OoIM/ZNq4FoR2GnIJ"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['4.0.2']}]
          self.save_major = true

				end
			end
		end
	end
end
