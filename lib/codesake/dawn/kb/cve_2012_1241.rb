module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-30
			class CVE_2012_1241
				include DependencyCheck

				def initialize
          message="GRScript18.dll before 1.2.2.0 in ActiveScriptRuby (ASR) before 1.8.7 does not properly restrict interaction with an Internet Explorer ActiveX environment, which allows remote attackers to execute arbitrary Ruby code via a crafted HTML document."
          super({
            :name=>"CVE-2012-1241",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2012, 4, 16),
            :cwe=>"264",
            :owasp=>"A9", 
            :applies=>["rails", "padrino", "sinatra"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ActiveScriptRuby to version 1.8.7. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["https://github.com/rails/rails/commit/11dafeaa7533be26441a63618be93a03869c83a9"]
          })

          self.safe_dependencies = [{:name=>"activescriptruby", :version=>['1.8.7']}]

				end
			end
		end
	end
end
