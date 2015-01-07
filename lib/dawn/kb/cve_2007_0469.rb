module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-07
			class CVE_2007_0469
				include DependencyCheck

				def initialize
          message = "The extract_files function in installer.rb in RubyGems before 0.9.1 does not check whether files exist before overwriting them, which allows user-assisted remote attackers to overwrite arbitrary files, cause a denial of service, or execute arbitrary code via crafted GEM packages."
           super({
            :name=>"CVE-2007-0469",
            :cvss=>"AV:N/AC:M/Au:N/C:C/I:C/A:C",
            :release_date => Date.new(2007, 1, 24),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"This vulnerability should never occur due to the rubygem evolution. However if it has been found, please upgrade your whole development environment ot something newer",
            :aux_links=>["http://www.securityfocus.com/archive/1/archive/1/458128/100/0/threaded"]
          })

          self.safe_dependencies = [{:name=>"rubygems", :version=>['0.9.1', '0.8.12']}]

				end
			end
		end
	end
end
