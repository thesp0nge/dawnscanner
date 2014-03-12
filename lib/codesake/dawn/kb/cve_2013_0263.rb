module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-14
			class CVE_2013_0263
				include DependencyCheck

				def initialize
          message = "Rack::Session::Cookie in Rack 1.5.x before 1.5.2, 1.4.x before 1.4.5, 1.3.x before 1.3.10, 1.2.x before 1.2.8, and 1.1.x before 1.1.6 allows remote attackers to guess the session cookie, gain privileges, and execute arbitrary code via a timing attack involving an HMAC comparison function that does not run in constant time."
           super({
            :name=>"CVE-2013-0263",
            :cvss=>"AV:N/AC:H/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 8, 2),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rack version to 1.5.2, 1.4.5, 1.3.10, 1.2.8, 1.1.6. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["https://groups.google.com/forum/#%21msg/rack-devel/RnQxm6i13C4/xfakH81yWvgJ"]
          })
           self.save_minor = true
           self.safe_dependencies = [{:name=>"rack", :version=>['1.5.2', '1.4.5', '1.3.10', '1.2.8', '1.1.6']}]
				end
			end
		end
	end
end
