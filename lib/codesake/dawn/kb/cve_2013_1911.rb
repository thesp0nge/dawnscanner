module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-27
			class CVE_2013_1911
				include DependencyCheck

				def initialize
          message = "lib/ldoce/word.rb in the ldoce 0.0.2 gem for Ruby allows remote attackers to execute arbitrary commands via shell metacharacters in (1) an mp3 URL or (2) file name."
          super({
            :name=>"CVE-2013-1911",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 4, 3),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails", "padrino", "sinatra"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ldoce version to the latest version available.",
            :aux_links=>["http://archives.neohapsis.com/archives/bugtraq/2013-04/0010.html"]
          })

          self.safe_dependencies = [{:name=>"ldoce", :version=>['0.0.3']}]

          
				end
			end
		end
	end
end
