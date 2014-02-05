module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-05
			class CVE_2014_1234
				include DependencyCheck

				def initialize
          message = "The paratrooper-newrelic gem 1.0.1 for Ruby allows local users to obtain the X-Api-Key value by listing the curl process."
          super({
            :name=>"CVE-2014-1234",
            :cvss=>"AV:L/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2014, 01, 10),
            :cwe=>"200",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade paratrooper-newrelic version up to version 1.0.1.",
            :aux_links=>["http://www.vapid.dhs.org/advisories/paratrooper-newrelic-api.html"]
          })

          self.safe_dependencies = [{:name=>"paratrooper-newrelic", :version=>['1.0.2']}]
				end
			end
		end
	end
end
