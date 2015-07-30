module Dawn
		module Kb
			# Automatically created with rake on 2015-07-30
			class CVE_2014_9490
				include DependencyCheck

				def initialize
          message = "The numtok function in lib/raven/okjson.rb in the raven-ruby gem before 0.12.2 for Ruby allows remote attackers to cause a denial of service via a large exponent value in a scientific number."

           super({
            :name=>"CVE-2014-9490",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2015, 1, 20),
            :cwe=>"399",
            :owasp=>"A9",
            :osvdb=>"115654",
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade raven-ruby gem to the latest version",
            :aux_links=>["https://github.com/getsentry/raven-ruby/commit/477ee93a3f735be33bc1e726820654cdf6e22d8f", "http://seclists.org/oss-sec/2015/q1/26"]
           })

           self.safe_dependencies = [{:name=>"raven-ruby", :version=>['0.12.2']}]

				end
			end
		end
end
