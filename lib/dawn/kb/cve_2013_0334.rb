	module Dawn
		module Kb
			class CVE_2013_0334
				include DependencyCheck

				def initialize
          message = "CVE-2013-0334: Bundler Gem for Ruby Multiple Top-level Source Lines Gemfile Handling Gem Installation Spoofing" 
          super({
            :name=>"CVE-2013-0334",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2014, 8, 13),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade bundler gem to 1.7.0 or later",
            :aux_links=>["http://bundler.io/blog/2014/08/14/bundler-may-install-gems-from-a-different-source-than-expected-cve-2013-0334.html", "https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0334"]
          })

          self.safe_dependencies = [{:name=>"bundler", :version=>['1.7.0']}]
				end
			end
		end
	end
