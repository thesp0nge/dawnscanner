module Dawn
		module Kb
			# Automatically created with rake on 2015-04-04
			class OSVDB_118954
				# Include the testing skeleton for this Security Check
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          message = "Ruby on Rails contains a flaw that is triggered when handling a to_json call to ActiveModel::Name, which can cause an infinite loop. This may allow a remote attacker to cause a denial of service."
          super({
            :name=> "OSVDB_118954",
            :cve=>"",
            :osvdb=>"118954",
            :cvss=>"",
            :release_date => Date.new(2015, 2, 28),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Currently, there are no known workarounds or upgrades to correct this issue. However, a patch has been committed to the source code repository (e.g. GIT, CVS, SVN) that addresses this vulnerability. Until it is incorporated into the next release of the software, manually patching an existing installation is the only known available solution. Check the vendor links in the references section for more information.",
            :aux_links=>[""]
           })
          self.safe_dependencies = [{:name=>"rails", :version=>['99.99.99']}]

				end
			end
		end
end
