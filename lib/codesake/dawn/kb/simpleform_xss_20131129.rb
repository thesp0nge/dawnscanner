module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-12-11
			class SimpleForm_Xss_20131129
				include DependencyCheck

				def initialize
          message = "There is a XSS vulnerability on Simple Form's label, hint and error options. When Simple Form creates a label, hint or error message it marks the text as being HTML safe, even though it may contain HTML tags. In applications where the text of these helpers can be provided by the users, malicious values can be provided and Simple Form will mark it as safe."

          super({
            :name=>"Simple Form XSS - 20131129",
            :cvss=>"none",
            :release_date => Date.new(2013, 11, 29),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "padrino", "sinatra"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade Simple Form the 3.0.1 and 2.1.1 releases are available at the normal locations.",
            :aux_links=>["https://groups.google.com/forum/#!topic/ruby-security-ann/flHbLMb07tE"]
          })

          self.safe_dependencies = [{:name=>"simple_form", :version=>['3.0.1', '2.1.1']}]

				end
			end
		end
	end
end
