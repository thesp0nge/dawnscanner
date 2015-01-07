module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-27
			class CVE_2013_2616
				include DependencyCheck

				def initialize
          message = "lib/mini_magick.rb in the MiniMagick Gem 1.3.1 for Ruby allows remote attackers to execute arbitrary commands via shell metacharacters in a URL."
          super({
            :name=>"CVE-2013-2616",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 3, 20),
            :cwe=>"94",
            :owasp=>"A9", 
            :applies=>["rails", "padrino", "sinatra"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade mini_magick gem version to the latest version available.",
            :aux_links=>["http://seclists.org/fulldisclosure/2013/Mar/123"]
          })

          self.safe_dependencies = [{:name=>"mini_magick", :version=>['1.3.2']}]

				end
			end
		end
	end
end
