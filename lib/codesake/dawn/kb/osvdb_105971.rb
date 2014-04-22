module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-04-17
			class OSVDB_105971
				include DependencyCheck

				def initialize
          message = "sfpagent Gem for Ruby contains a flaw that is triggered as JSON[body] input is not properly sanitized when handling module names with shell metacharacters. This may allow a context-dependent attacker to execute arbitrary commands."

           super({
            :name=> "OSVDB-105971",
            :cvss=>"",
            :release_date => Date.new(2014, 4, 16),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rack", "sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade sfpagent version at least to 0.4.15. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["http://seclists.org/oss-sec/2014/q2/118"]
           })
           self.safe_dependencies = [{:name=>"sfpagent", :version=>['0.4.15']}]

				end
			end
		end
	end
end
