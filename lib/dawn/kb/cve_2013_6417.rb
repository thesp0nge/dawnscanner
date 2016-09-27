	module Dawn
		module Kb
			# Automatically created with rake on 2013-12-12
			class CVE_2013_6417
				include DependencyCheck

				def initialize
          message ="actionpack/lib/action_dispatch/http/request.rb in Ruby on Rails before 3.2.16 and 4.x before 4.0.2 does not properly consider differences in parameter handling between the Active Record component and the JSON implementation, which allows remote attackers to bypass intended database-query restrictions and perform NULL checks or trigger missing WHERE clauses via a crafted request that leverages (1) third-party Rack middleware or (2) custom Rack middleware. NOTE: this vulnerability exists because of an incomplete fix for CVE-2013-0155."

           super({
            :name=>"CVE-2013-6417",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:N",
            :release_date => Date.new(2013, 12, 7),
            :cwe=>"264",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails to version 3.2.16 or 4.0.2. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=ruby-security-ann/niK4drpSHT4/g8JW8ZsayRkJ"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.2.16', '4.0.2', '3.1.9999', '3.0.9999']}]

          self.save_major = true

				end
			end
		end
	end
