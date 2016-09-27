module Dawn
		module Kb
			# Automatically created with rake on 2015-12-02
			class CVE_2015_4020
				# Include the testing skeleton for this CVE
				# include PatternMatchCheck
				# include DependencyCheck
				# include RubyVersionCheck
        include GemCheck

				def initialize
          title="RubyGems remote_fetcher.rb api_endpoint() Function Missing SRV Record Hostname Validation Request Hijacking"
          message = "RubyGems 2.0.x before 2.0.17, 2.2.x before 2.2.5, and 2.4.x before 2.4.8 does not validate the hostname when fetching gems or making API request, which allows remote attackers to redirect requests to arbitrary domains via a crafted DNS SRV record with a domain that is suffixed with the original domain name, aka a 'DNS hijack attack.'"
          super({
            :title=>title,
            :name=> "CVE-2015-4020",
            :cve=>"2015-4020",
            :osvdb=>"122162",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2015, 8, 25),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::GEM_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rubygem to version 3.2.3 or later.",
            :aux_links=>[""]
           })

          self.safe_versions = [{:version=>['2.0.17', '2.2.5', '2.4.8']}]
				end
			end
		end
end
