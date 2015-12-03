	module Dawn
		module Kb
			# Automatically created with rake on 2014-07-07
			class CVE_2014_3483
				include DependencyCheck

				def initialize
          message = "Ruby on Rails contains a flaw that may allow carrying out an SQL injection attack. The issue is due to the PostgreSQL adapter for Active Record not properly sanitizing user-supplied input when quoting ranges. This may allow a remote attacker to inject or manipulate SQL queries in the back-end database, allowing for the manipulation or disclosure of arbitrary data."
           super({
            :name=>"CVE-2014-3483",
            :cve=>"2014-3483",
            :osvdb=>"108665",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2014, 7, 2),
            :cwe=>"",
            :owasp=>"A1",
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails at least to version 4.0.7 or 4.1.3. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2014/7/2/Rails_3_2_19_4_0_7_and_4_1_3_have_been_released/"]
           })
           self.save_major=true
           self.safe_dependencies = [{:name=>"rails", :version=>['4.0.7', '4.1.3']}]
				end
			end
		end
	end
