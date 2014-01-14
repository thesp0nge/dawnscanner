module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-14
			class CVE_2013_0162
				include DependencyCheck

				def initialize
          message = "The diff_pp function in lib/gauntlet_rubyparser.rb in the ruby_parser gem 3.1.1 and earlier for Ruby allows local users to overwrite arbitrary files via a symlink attack on a temporary file with a predictable name in /tmp."

           super({
            :name=>"CVE-2013-0162",
            :cvss=>"AV:L/AC:L/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2013, 3, 1),
            :cwe=>"264",
            :owasp=>"A9", 
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby_parser version to 3.1.1. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["https://bugzilla.redhat.com/show_bug.cgi?id=892806"]
          })

          self.safe_dependencies = [{:name=>"ruby_parser", :version=>['1.9999.9999', '2.9999.9999', '3.1.1']}]

				end
			end
		end
	end
end
