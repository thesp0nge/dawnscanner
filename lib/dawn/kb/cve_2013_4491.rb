	module Dawn
		module Kb
			# Automatically created with rake on 2013-12-11
			class CVE_2013_4491
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in actionpack/lib/action_view/helpers/translation_helper.rb in the internationalization component in Ruby on Rails 3.x before 3.2.16 and 4.x before 4.0.2 allows remote attackers to inject arbitrary web script or HTML via a crafted string that triggers generation of a fallback string by the i18n gem."
          
          super({
            :name=>"CVE-2013-4491",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2013, 12, 7),
            :cwe=>"79",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails to version 3.2.16 or 4.0.2. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=ruby-security-ann/pLrh6DUw998/bLFEyIO4k_EJ"]
          })

          self.save_major = true
          self.safe_dependencies = [{:name=>"rails", :version=>['3.2.16', '4.0.2', '3.1.9999', '3.0.9999']}]

				end
			end
		end
	end
