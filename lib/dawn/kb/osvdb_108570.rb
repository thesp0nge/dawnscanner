module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-07-04
			class OSVDB_108570
				include DependencyCheck

				def initialize
          message = "backup_checksum Gem for Ruby contains a flaw in /lib/backup/cli/utility.rb that is triggered when handling metacharacters. This may allow a remote attacker to execute arbitrary commands."
           super({
            :name=> "OSVDB-108570",
            :cvss=>"",
            :osvdb=> "108570",
            :release_date => Date.new(2014, 6, 30),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rack", "sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"We are not currently aware of a solution for this vulnerability. Please check backup_checksum rubygem for upgrades",
            :aux_links=>["http://www.vapid.dhs.org/advisories/backup_checksum-3.0.23.html"]
           })
           self.safe_dependencies = [{:name=>"backup_checksum", :version=>['3.0.24']}]

				end
			end
		end
	end
end
