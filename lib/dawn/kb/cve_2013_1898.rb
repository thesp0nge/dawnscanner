module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-27
			class CVE_2013_1898
				include DependencyCheck

				def initialize
          message = "lib/thumbshooter.rb in the Thumbshooter 0.1.5 gem for Ruby allows remote attackers to execute arbitrary commands via shell metacharacters in a URL."
          super({
            :name=>"CVE-2013-1898",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 4, 9),
            :cwe=>"94",
            :owasp=>"A9", 
            :applies=>["rails", "padrino", "sinatra"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade Thumbshooter version to the latest version available.",
            :aux_links=>["http://seclists.org/fulldisclosure/2013/Mar/218"]
          })

          self.safe_dependencies = [{:name=>"thumbshooter", :version=>['0.1.6']}]

				end
			end
		end
	end
end
