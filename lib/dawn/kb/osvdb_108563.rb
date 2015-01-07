module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-07-04
			class OSVDB_108563
				include DependencyCheck

				def initialize
          message = "gyazo Gem for Ruby contains a flaw in client.rb that is triggered when handling metacharacters. This may allow a remote attacker to execute arbitrary commands."
           super({
            :name=> "OSVDB-108563",
            :cvss=>"",
            :cve=>"",
            :osvdb=>"108563",
            :release_date => Date.new(2014, 6, 30),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rack", "sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"We are not currently aware of a solution for this vulnerability. Please check gyazo rubygem for updates and apply them as soon as possible",
            :aux_links=>["http://www.vapid.dhs.org/advisories/gyazo-1.0.0.html"],
           })
           self.safe_dependencies = [{:name=>"gyazo", :version=>['1.0.1']}]

				end
			end
		end
	end
end
