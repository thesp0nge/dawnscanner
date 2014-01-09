module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2007_6612
				include DependencyCheck

				def initialize
          message = "Directory traversal vulnerability in DirHandler (lib/mongrel/handlers.rb) in Mongrel 1.0.4 and 1.1.x before 1.1.3 allows remote attackers to read arbitrary files via an HTTP request containing double-encoded sequences (\".%252e\")."

          super({
            :name=>"CVE-2007-6612",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:N",
            :release_date => Date.new(2008, 3, 1),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade mongrel to version 1.1.3 or above",
            :aux_links=>["http://www.securityfocus.com/bid/27133"]
          })

          self.safe_dependencies = [{:name=>"mongrel", :version=>['1.1.3']}]

				end
			end
		end
	end
end
