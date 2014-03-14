module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-05
			class CVE_2013_4489
				include DependencyCheck

				def initialize
          message = "There is a remote code execution vulnerability in the code search feature of GitLab provided by the grit gem."

          super({
            :name=>"CVE-2013-4489",
            :cvss=>"",
            :release_date => Date.new(2013, 11, 4),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade grit version up to version at least to 5.4.1 or 6.2.3. Using the latest version however is always suggested.",
            :aux_links=>["http://seclists.org/oss-sec/2013/q4/224"]
          })

          self.safe_dependencies = [{:name=>"grit", :version=>[ '5.4.1', '6.2.3' ]}]
          self.not_affected = {:name=>"grit", :version=>['5.1', '5.0', '4.x', '3.x', '2.x', '1.x', '0.x'], :earlier=>true}
				end
			end
		end
	end
end
