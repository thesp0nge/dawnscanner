module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-27
			class CVE_2013_1947
				include DependencyCheck

				def initialize
          message = "kelredd-pruview gem 0.3.8 for Ruby allows context-dependent attackers to execute arbitrary commands via shell metacharacters in a filename argument to (1) document.rb, (2) video.rb, or (3) video_image.rb."
          super({
            :name=>"CVE-2013-1947",
            :cvss=>"AV:N/AC:M/Au:N/C:C/I:C/A:C",
            :release_date => Date.new(2013, 4, 25),
            :cwe=>"78",
            :owasp=>"A9", 
            :applies=>["rails", "padrino", "sinatra"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade kelredd-pruview version to the latest version available.",
            :aux_links=>["http://www.openwall.com/lists/oss-security/2013/04/10/3"]
          })

          self.safe_dependencies = [{:name=>"kelredd-pruview", :version=>['0.3.9']}]

				end
			end
		end
	end
end
