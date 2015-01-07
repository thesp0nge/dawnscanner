module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-14
			class CVE_2013_6459
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in the will_paginate gem before 3.0.5 for Ruby allows remote attackers to inject arbitrary web script or HTML via vectors involving generated pagination links."
          
          super({
            :name=>"CVE-2013-6459",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2013, 12, 31),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade will_paginage version to 3.0.5. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["https://github.com/mislav/will_paginate/releases/tag/v3.0.5"]
          })

          self.safe_dependencies = [{:name=>"will_paginate", :version=>['3.0.5']}]

				end
			end
		end
	end
end
