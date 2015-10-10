module Dawn
		module Kb
			# Automatically created with rake on 2015-07-29
			class CVE_2015_3226
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in json/encoding.rb in Active Support in Ruby on Rails 3.x and 4.1.x before 4.1.11 and 4.2.x before 4.2.2 allows remote attackers to inject arbitrary web script or HTML via a crafted Hash that is mishandled during JSON encoding."
          super({
            :name=>"CVE-2015-3226",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2015, 7, 26),
            :cwe=>"79",
            :owasp=>"A3",
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade activesupport gem to latest version or at least 4.1.12 or 4.2.3. This is automatically done by upgrading your Rails environment if you are using it.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=rubyonrails-security/7VlB_pck3hU/3QZrGIaQW6cJ"]
           })
          self.save_minor = true
          self.safe_dependencies = [{:name=>"activesupport", :version=>['4.1.12', '4.2.3', '3.99.99']}]

				end
			end
		end
end
