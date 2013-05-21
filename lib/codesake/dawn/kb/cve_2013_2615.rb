module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-17
			class CVE_2013_2615
				include DependencyCheck

				def initialize
          message = "lib/entry_controller.rb in the fastreader Gem 1.0.8 for Ruby allows remote attackers to execute arbitrary commands via shell metacharacters in a URL."
          super({
            :name=>"CVE-2013-2615",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 3, 20),
            :cwe=>"94",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade fastreader gem to a newer version",
            :aux_links=>["http://seclists.org/fulldisclosure/2013/Mar/122"]
          })

          self.safe_dependencies = [{:name=>"fastreader", :version=>['1.0.9']}]

				end
			end
		end
	end
end
