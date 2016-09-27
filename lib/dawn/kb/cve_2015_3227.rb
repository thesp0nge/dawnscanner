module Dawn
		module Kb
			# Automatically created with rake on 2015-07-29
			class CVE_2015_3227
				include DependencyCheck

				def initialize
          message = "The (1) jdom.rb and (2) rexml.rb components in Active Support in Ruby on Rails before 4.1.11 and 4.2.x before 4.2.2, when JDOM or REXML is enabled, allow remote attackers to cause a denial of service (SystemStackError) via a large XML document depth."

          super({
            :name=>"CVE-2015-3227",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2015, 7, 26),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade activesupport gem to latest version or at least 4.1.12 or 4.2.3. This is automatically done by upgrading your Rails environment if you are using it.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=rubyonrails-security/bahr2JLnxvk/x4EocXnHPp8J"]
           })
          self.save_minor = true
          self.safe_dependencies = [{:name=>"activesupport", :version=>['4.1.12', '4.2.3']}]
          self.save_major = true
				end
			end
		end
end
