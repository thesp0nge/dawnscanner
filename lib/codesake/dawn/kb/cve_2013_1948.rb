module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-27
			class CVE_2013_1948
				include DependencyCheck

				def initialize
          message = "converter.rb in the md2pdf gem 0.0.1 for Ruby allows context-dependent attackers to execute arbitrary commands via shell metacharacters in a filename."
          super({
            :name=>"CVE-2013-1948",
            :cvss=>"AV:N/AC:L/Au:N/C:C/I:C/A:C",
            :release_date => Date.new(2013, 4, 25),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "padrino", "sinatra"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade md2pdf gem version to the latest version available.",
            :aux_links=>["http://www.securityfocus.com/bid/59061"]
          })

          self.safe_dependencies = [{:name=>"md2pdf", :version=>['0.0.2']}]

				end
			end
		end
	end
end
