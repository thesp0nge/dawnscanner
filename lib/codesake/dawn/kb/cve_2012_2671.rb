module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-14
			class CVE_2012_2671
				include DependencyCheck

				def initialize
          message = "The Rack::Cache rubygem 0.3.0 through 1.1 caches Set-Cookie and other sensitive headers, which allows attackers to obtain sensitive cookie information, hijack web sessions, or have other unspecified impact by accessing the cache."

          super({
            :name=>'CVE-2012-2671', 
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",  
            :release_date => Date.new(2012, 6, 17),
            :cwe=>"", 
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade ruby-cache version up to 1.1.1. As a general rule, using the latest stable rails version is recommended.",
            :aux_links => ["https://github.com/rtomayko/rack-cache/pull/52"]
          })
          self.safe_dependencies = [{:name=>"rack-cache", :version=>['0.9999.9999', '1.1.2']}]


				end
			end
		end
	end
end
