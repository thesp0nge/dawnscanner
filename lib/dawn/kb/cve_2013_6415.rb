	module Dawn
		module Kb
			# Automatically created with rake on 2013-12-12
			class CVE_2013_6415
				include DependencyCheck

				def initialize
          message="Cross-site scripting (XSS) vulnerability in the number_to_currency helper in actionpack/lib/action_view/helpers/number_helper.rb in Ruby on Rails before 3.2.16 and 4.x before 4.0.2 allows remote attackers to inject arbitrary web script or HTML via the unit parameter."
          super({
            :name=>"CVE-2013-6415",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2013, 12, 7),
            :cwe=>"79",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails to version 3.2.16 or 4.0.2. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=ruby-security-ann/9WiRn2nhfq0/2K2KRB4LwCMJ"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.2.16', '4.0.2', '3.1.9999', '3.0.9999']}]
          self.save_major = true


				end
			end
		end
	end
