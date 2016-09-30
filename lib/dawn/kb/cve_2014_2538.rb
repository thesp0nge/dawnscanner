	module Dawn
		module Kb
			# Automatically created with rake on 2014-03-23
			class CVE_2014_2538
				include DependencyCheck

				def initialize
          message = "rack-ssl Gem for Ruby contains a flaw that allows a reflected cross-site scripting (XSS) attack. This flaw exists because the program does not validate input passed via error messages before returning it to users. This may allow a context-dependent attacker to create a specially crafted request that would execute arbitrary script code in a user's browser session within the trust relationship between their browser and the server."
           super({
            :name=>"CVE-2014-2538",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2014, 3, 25),
            :cwe=>"79",
            :owasp=>"A3",
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"A new version for rack-ssl version it has been released. Pleas upgrade at least to version 1.3.4 or higher.",
            :aux_links=>["http://seclists.org/oss-sec/2014/q1/594"]
           })

           self.safe_dependencies = [{:name=>"rack-ssl", :version=>['1.3.4']}]
				end
			end
		end
	end
