module Dawn
		module Kb
			# Automatically created with rake on 2015-12-02
			class OSVDB_121701
				include DependencyCheck

				def initialize
          title = "open-uri-cached Gem for Ruby Unsafe Temporary File Creation Local Privilege Escalation"
          message = "open-uri-cached Gem for Ruby contains a flaw that is due to the program creating temporary files in a predictable, unsafe manner when using YAML. This may allow a local attacker to gain elevated privileges."

          super({
            :title=>title,
            :name=> "OSVDB_121701",
            :cve=>"",
            :osvdb=>"121701",
            :cvss=>"",
            :release_date => Date.new(2015, 5, 5),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade open-uri-cached gem to version 0.0.5 or later.",
            :aux_links=>[""]
           })
          self.safe_dependencies = [{:name=>"open-uri-cached", :version=>['0.0.5']}]
				end
			end
		end
end
