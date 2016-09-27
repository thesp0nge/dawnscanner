	module Dawn
		module Kb
			# Automatically created with rake on 2013-12-12
			class CVE_2013_6414
				include DependencyCheck

				def initialize
          message = "actionpack/lib/action_view/lookup_context.rb in Action View in Ruby on Rails 3.x before 3.2.16 and 4.x before 4.0.2 allows remote attackers to cause a denial of service (memory consumption) via a header containing an invalid MIME type that leads to excessive caching."


          super({
            :name=>"CVE-2013-6414",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2013, 12, 7),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails to version 3.2.16 or 4.0.2. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=ruby-security-ann/A-ebV4WxzKg/KNPTbX8XAQUJ"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.2.16', '4.0.2', '3.1.9999', '3.0.9999']}]
          self.save_major = true

				end
			end
		end
	end
