module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-17
			class CVE_2013_1875
				include DependencyCheck

				def initialize
          message="command_wrap.rb in the command_wrap Gem for Ruby allows remote attackers to execute arbitrary commands via shell metacharacters in a URL or filename."
         super({
            :name=>"CVE-2013-1875",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 3, 20),
            :cwe=>"94",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade command_wrap gem to a newer version",
            :aux_links=>["http://seclists.org/fulldisclosure/2013/Mar/175"]
          })

          self.safe_dependencies = [{:name=>"fastreader", :version=>['1.0.9']}]
 
				end
			end
		end
	end
end
