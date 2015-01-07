module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-13
			class CVE_2011_2931
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in the strip_tags helper in actionpack/lib/action_controller/vendor/html-scanner/html/node.rb in Ruby on Rails before 2.3.13, 3.0.x before 3.0.10, and 3.1.x before 3.1.0.rc5 allows remote attackers to inject arbitrary web script or HTML via a tag with an invalid name." 
          super({
            :name=>"CVE-2011-2931",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2011, 8, 29),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.13, 3.0.10, 3.1.0. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/d/topic/rubyonrails-security/Vr_7WSOrEZU/discussion"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.13', '3.0.10', '3.1.0']}]


          
          
				end
			end
		end
	end
end
