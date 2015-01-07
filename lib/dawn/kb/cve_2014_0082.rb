module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-21
			class CVE_2014_0082
				include DependencyCheck

				def initialize
          message = "actionpack/lib/action_view/template/text.rb in Action View in Ruby on Rails 3.x before 3.2.17 converts MIME type strings to symbols during use of the :text option to the render method, which allows remote attackers to cause a denial of service (memory consumption) by including these strings in headers."

           super({
            :name=>"CVE-2014-0082",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2014, 2, 20),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.2.17. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=rubyonrails-security/LMxO_3_eCuc/ozGBEhKaJbIJ"]
           })

           self.safe_dependencies = [{:name=>"rails", :version=>['3.2.17', '3.1.9999', '3.0.99999', '2.99999.99999', '1.99999.99999']}]
				end
			end
		end
	end
end
