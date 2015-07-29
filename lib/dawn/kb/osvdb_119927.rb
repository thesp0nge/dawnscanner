module Dawn
		module Kb
			# Automatically created with rake on 2015-03-27
			class OSVDB_119927
				# Include the testing skeleton for this Security Check
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          message = "http Gem for Ruby contains a flaw related to certificate validation. The issue is due to a failure to call the OpenSSL::SSL::SSLSocket#post_connection_check method, leading to hostnames not being properly verified. By spoofing the TLS/SSL server via a certificate that appears valid, an attacker with the ability to intercept network traffic (e.g. MiTM, DNS cache poisoning) can disclose and optionally manipulate transmitted data."

           super({
            :name=> "OSVDB_119927",
            :cve=>"2015-1828",
            :osvdb=>"119927",
            :cvss=>"",
            :release_date => Date.new(2015, 3, 25),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade http gem version at least to 0.8.0. As a general rule, using the latest stable version is recommended.",
            :aux_links=>[""]
           })
           self.safe_dependencies = [{:name=>"http", :version=>['0.8.0']}]


				end
			end
		end
end
