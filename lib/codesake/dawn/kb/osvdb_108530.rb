module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-07-04
			class OSVDB_108530
				include DependencyCheck

				def initialize
          message = "kajam Gem for Ruby contains a flaw in /dataset/lib/dataset/database/postgresql.rb that is triggered when handling metacharacters. This may allow a remote attacker to execute arbitrary commands."
           super({
            :name=> "OSVDB-108530",
            :cvss=>"",
            :osvdb=>"108530",
            :release_date => Date.new(2014, 6, 30),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rack", "sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"We are not currently aware of a solution for this vulnerability. Keep track on kajam gem updates",
            :aux_links=>["http://www.vapid.dhs.org/advisories/kajam-1.0.3.rc2-2nd-vuln.html"]
           })
           self.safe_dependencies = [{:name=>"kajam", :version=>['1.0.3.rc3']}]

				end
			end
		end
	end
end
