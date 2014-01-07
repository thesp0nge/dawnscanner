module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-07
			class CVE_2006_4112
				include DependencyCheck

				def initialize
          message = "Unspecified vulnerability in the \"dependency resolution mechanism\" in Ruby on Rails 1.1.0 through 1.1.5 allows remote attackers to execute arbitrary Ruby code via a URL that is not properly handled in the routing code, which leads to a denial of service (application hang) or \"data loss,\" a different vulnerability than CVE-2006-4111."
           super({
            :name=>"CVE-2006-4112",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2006, 8, 14),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 1.1.6 or higher. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2006/8/10/rails-1-1-6-backports-and-full-disclosure"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['1.1.6']}]

				end
			end
		end
	end
end
