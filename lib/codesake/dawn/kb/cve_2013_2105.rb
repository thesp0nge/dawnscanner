module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-05-12
			class CVE_2013_2105
				include DependencyCheck

				def initialize
          message = "The Show In Browser (show_in_browser) gem 0.0.3 for Ruby allows local users to inject arbitrary web script or HTML via a symlink attack on /tmp/browser.html."
           super({
            :name=>"CVE-2013-2105",
            :cvss=>"AV:L/AC:M/AU:N/C:N/I:P/A:P",
            :release_date => Date.new(2014, 4, 22),
            :cwe=>"59",
            :owasp=>"A9",
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade show_in_browser version at least to 0.0.4. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["http://xforce.iss.net/xforce/xfdb/84378"]
           })
           self.safe_dependencies = [{:name=>"show_in_browser", :version=>['0.0.4']}]

				end
			end
		end
	end
end
