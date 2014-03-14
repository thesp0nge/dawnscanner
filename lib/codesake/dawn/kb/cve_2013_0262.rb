module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-06
			class CVE_2013_0262
				include DependencyCheck

				def initialize
          message = "rack/file.rb (Rack::File) in Rack 1.5.x before 1.5.2 and 1.4.x before 1.4.5 allows attackers to access arbitrary files outside the intended root directory via a crafted PATH_INFO environment variable, probably a directory traversal vulnerability that is remotely exploitable, aka \"symlink path traversals.\""
          super({
            :name=>"CVE-2013-0262",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2013, 2, 8),
            :cwe=>"22",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rack version up to version 1.5.2 or 1.4.5 or higher.",
            :aux_links=>["https://groups.google.com/forum/#%21msg/rack-devel/mZsuRonD7G8/DpZIOmMLbOgJ"]
          })
          self.save_minor = true
          self.safe_dependencies = [{:name=>"rack", :version=>['1.5.2', '1.4.5']}]
				end
			end
		end
	end
end
