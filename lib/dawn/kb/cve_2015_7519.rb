module Dawn
		module Kb
			# Automatically created with rake on 2016-02-02
			class CVE_2015_7519
				# Include the testing skeleton for this CVE
				include DependencyCheck

				def initialize
          message ="agent/Core/Controller/SendRequest.cpp in Phusion Passenger before 4.0.60 and 5.0.x before 5.0.22, when used in Apache integration mode or in standalone mode without a filtering proxy, allows remote attackers to spoof headers passed to applications by using an _ (underscore) character instead of a - (dash) character in an HTTP header, as demonstrated by an X_User header."
          super({
            :title=>title,
            :name=> "CVE-2015-7519",
            :cve=>"2015-7519",
            :osvdb=>"",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2016, 1, 8),
            :cwe=>"119",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade passenger gem to version 4.0.60, 5.0.22 or later.",
            :aux_links=>["https://blog.phusion.nl/2015/12/07/cve-2015-7519/"]
           })

          self.safe_dependencies = [{:name=>"passenger", :version=>['4.0.60', '5.0.22']}]

				end
			end
		end
end
