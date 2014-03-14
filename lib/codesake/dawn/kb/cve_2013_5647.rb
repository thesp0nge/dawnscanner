module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-14
			class CVE_2013_5647
				include DependencyCheck

				def initialize
          message = "lib/sounder/sound.rb in the sounder gem 1.0.1 for Ruby allows remote attackers to execute arbitrary commands via shell metacharacters in a filename."

         super({
            :name=>"CVE-2013-5647",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 8, 29),
            :cwe=>"94",
            :owasp=>"A9", 
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade sounder version up to 1.0.1. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["http://vapid.dhs.org/advisories/sounder-ruby-gem-cmd-inj.html"]
          })

          self.safe_dependencies = [{:name=>"sounder", :version=>['1.0.2']}]
          self.save_major = true
 
				end
			end
		end
	end
end
