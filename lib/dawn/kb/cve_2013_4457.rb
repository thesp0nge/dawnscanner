module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-11-26
			class CVE_2013_4457
				include DependencyCheck

				def initialize
          message="The Cocaine gem 0.4.0 through 0.5.2 for Ruby allows context-dependent attackers to execute arbitrary commands via a crafted has object, related to recursive variable interpolation."
          super({
            :name=>"CVE-2013-4457",
            :cvss=>"not assigned",
            :release_date => Date.new(2013, 10, 22),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"You must upgrade to cocain gem version 0.5.3 or later",
            :aux_links=>["https://groups.google.com/forum/#!topic/ruby-security-ann/3XTGFbAJoTg"]
          })

          self.save_minor = true
          self.safe_dependencies = [{:name=>"cocaine", :version=>['0.5.3', '0.4.3', '0.3.0']}]


				end
			end
		end
	end
end
