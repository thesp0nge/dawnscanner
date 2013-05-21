module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-21
			class CVE_2013_0284
				include DependencyCheck

				def initialize
          message = "Ruby agent 3.2.0 through 3.5.2 serializes sensitive data when communicating with servers operated by New Relic, which allows remote attackers to obtain sensitive information (database credentials and SQL statements) by sniffing the network and deserializing the data."
          super({
            :name=>"CVE-2013-0284",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2013, 4, 9),
            :cwe=>"200",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby_agent gem to version 3.5.2 or latest version available",
            :aux_links=>["https://newrelic.com/docs/ruby/ruby-agent-security-notification"]
          })

          self.safe_dependencies = [{:name=>"ruby_agent", :version=>['3.5.2']}]

				end
			end
		end
	end
end
