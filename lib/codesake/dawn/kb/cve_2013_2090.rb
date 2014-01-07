module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-07
			class CVE_2013_2090
				include DependencyCheck

				def initialize
          message = "Ruby Gem Creme Fraiche version 0.6 suffers from a remote command injection vulnerability due to unsanitized input."
          super({
            :name=>"CVE-2013-2090",
            :cvss=>"",
            :release_date => Date.new(2013, 5, 14),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade cremefraiche gem version to the latest available.",
            :aux_links=>["http://packetstormsecurity.com/files/cve/CVE-2013-2090"]
          })

          self.safe_dependencies = [{:name=>"cremefraiche", :version=>['0.6.2']}]


				end
			end
		end
	end
end
