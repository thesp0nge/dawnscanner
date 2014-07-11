module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-03-14
			class CVE_2014_0036
				include DependencyCheck

				def initialize
          message = "rbovirt Gem for Ruby contains a flaw related to certificate validation. The issue is due to the program failing to validate SSL certificates. This may allow an attacker with access to network traffic (e.g. MiTM, DNS cache poisoning) to spoof the SSL server via an arbitrary certificate that appears valid. Such an attack would allow for the interception of sensitive traffic, and potentially allow for the injection of content into the SSL stream."

           super({
            :name=>"CVE-2014-0036",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2014, 3, 5),
            :cwe=>"20",
            :owasp=>"A9",
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rbovirt version at least to 0.0.24. As a general rule, using the latest version is recommended.",
            :aux_links=>["http://www.securityfocus.com/bid/66006"]
           })

           self.safe_dependencies = [{:name=>"rbovirt", :version=>['0.0.24']}]
				end
			end
		end
	end
end
