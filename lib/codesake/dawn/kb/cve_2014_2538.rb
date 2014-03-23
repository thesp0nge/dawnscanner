module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-03-23
			class CVE_2014_2538
				include DependencyCheck

				def initialize
          message = "rack-ssl Gem for Ruby contains a flaw that allows a reflected cross-site scripting (XSS) attack. This flaw exists because the program does not validate input passed via error messages before returning it to users. This may allow a context-dependent attacker to create a specially crafted request that would execute arbitrary script code in a user's browser session within the trust relationship between their browser and the server."
           super({
            :name=>"CVE-2014-2538",
            :cvss=>"",
            :release_date => Date.new(2013, 7, 9),
            :cwe=>"79",
            :owasp=>"A3",
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Currently, there are no known workarounds or upgrades to correct this issue. However, a patch has been committed to the source code repository (e.g. GIT, CVS, SVN) that addresses this vulnerability. Until it is incorporated into the next release of the software, manually patching an existing installation is the only known available solution. Check the vendor links in the references section for more information.",
            :aux_links=>["http://seclists.org/oss-sec/2014/q1/594"]
           })

           self.safe_dependencies = [{:name=>"rack-ssl", :version=>['1.5.0']}]
				end
			end
		end
	end
end
