module Dawn
		module Kb
			# Automatically created with rake on 2015-07-30
			class CVE_2015_3448
				include DependencyCheck

				def initialize
          message = "REST client for Ruby (aka rest-client) before 1.7.3 logs usernames and passwords, which allows local users to obtain sensitive information by reading the log."

          super({
            :name=>"CVE-2015-3448",
            :cvss=>"AV:L/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2015, 4, 29),
            :cwe=>"200",
            :owasp=>"A9",
            :osvdb=>"117461",
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rest-client gem to the latest version",
            :aux_links=>["https://github.com/rest-client/rest-client/issues/349","http://www.osvdb.org/117461"]
           })

          self.safe_dependencies = [{:name=>"rest-client", :version=>['1.7.3']}]

				end
			end
		end
end
