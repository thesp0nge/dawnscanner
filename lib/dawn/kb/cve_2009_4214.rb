module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2009_4214
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in the strip_tags function in Ruby on Rails before before 2.3.5, allows remote attackers to inject arbitrary web script or HTML via vectors involving non-printing ASCII characters, related to HTML::Tokenizer and actionpack/lib/action_controller/vendor/html-scanner/html/node.rb."
          super({
            :name=>"CVE-2009-4214",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2009, 12, 7),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.5 or higher. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://groups.google.com/group/rubyonrails-security/browse_thread/thread/4d4f71f2aef4c0ab?pli=1"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.5', '2.2.999', '2.1.999', '1.999.999', '0.999.999']}]

				end
			end
		end
	end
end
