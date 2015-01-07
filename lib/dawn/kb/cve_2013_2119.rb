module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-10
			class CVE_2013_2119
				include DependencyCheck

				def initialize
          message = "Phusion Passenger gem before 3.0.21 and 4.0.x before 4.0.5 for Ruby allows local users to cause a denial of service (prevent application start) or gain privileges by pre-creating a temporary \"config\" file in a directory with a predictable name in /tmp/ before it is used by the gem."
           super({
            :name=>"CVE-2013-2119",
            :cvss=>"AV:L/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2014, 1, 3),
            :cwe=>"16",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade passenger to version 3.0.21, 4.0.5 or above",
            :aux_links=>["http://blog.phusion.nl/2013/05/29/phusion-passenger-4-0-5-released/", "http://blog.phusion.nl/2013/05/29/phusion-passenger-3-0-21-released/"]
          })

          self.safe_dependencies = [{:name=>"passenger", :version=>['4.0.5', '3.0.21']}]

				end
			end
		end
	end
end
