module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-05
			class CVE_2014_1233
				include DependencyCheck

				def initialize
          message = "The paratrooper-pingdom gem 1.0.0 for Ruby allows local users to obtain the App-Key, username, and password values by listing the curl process."

          super({
            :name=>"CVE-2014-1233",
            :cvss=>"AV:L/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2014, 01, 10),
            :cwe=>"200",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade paratrooper-pingdom version up to version 1.0.0.",
            :aux_links=>["http://www.vapid.dhs.org/advisories/paratrooper-api-key-pingdom.html"]
          })

          self.safe_dependencies = [{:name=>"paratrooper-pingdom", :version=>['1.0.1']}]
				end
			end
		end
	end
end
