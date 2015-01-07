module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-06
			class CVE_2013_0183
				include DependencyCheck

				def initialize
          message = "multipart/parser.rb in Rack 1.3.x before 1.3.8 and 1.4.x before 1.4.3 allows remote attackers to cause a denial of service (memory consumption and out-of-memory error) via a long string in a Multipart HTTP packet."
          super({
            :name=>"CVE-2013-0183",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2013, 3, 1),
            :cwe=>"119",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rack version up to version 1.3.8 or 1.4.3 or higher.",
            :aux_links=>["https://groups.google.com/forum/#%21topic/rack-devel/7ZKPNAjgRSs"]
          })
          self.safe_dependencies = [{:name=>"rack", :version=>['1.4.3', '1.3.8']}]
				end
			end
		end
	end
end
