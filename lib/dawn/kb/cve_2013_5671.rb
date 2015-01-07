module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-06
			class CVE_2013_5671
				include DependencyCheck

				def initialize
          message = "fog-dragonfly Gem for Ruby contains a flaw that is due to the program failing to properly sanitize input passed via the imagemagickutils.rb script. This may allow a remote attacker to execute arbitrary commands."
          super({
            :name=>"CVE-2013-5671",
            :cvss=>"",
            :release_date => Date.new(2013, 9, 3),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade fog-dragonfly version up to version 0.8.2.",
            :aux_links=>["http://seclists.org/fulldisclosure/2013/Sep/18"]
          })
          self.safe_dependencies = [{:name=>"fog-dragonfly", :version=>['0.8.3']}]

				end
			end
		end
	end
end
