module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-10-22
			class CVE_2013_4389
				include DependencyCheck

				def initialize
          message = "Multiple format string vulnerabilities in log_subscriber.rb files in the log subscriber component in Action Mailer in Ruby on Rails 3.x before 3.2.15 allow remote attackers to cause a denial of service via a crafted e-mail address that is improperly handled during construction of a log message."
           super({
            :name=>'CVE-2013-4389', 
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:N/A:P",  
            :release_date => Date.new(2013, 10, 17),
            :cwe=>"134", 
            :owasp=>"A9",
            :applies=>["rails"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade rails version at least to 3.0.21, 3.1.10 or 3.2.15. As a general rule, using the latest stable rails version is recommended.",
            :aux_links => ["https://groups.google.com/forum/message/raw?msg=ruby-security-ann/yvlR1Vx44c8/elKJkpO2KVgJ"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.0.21', '3.1.10', '3.2.15']}]
				end
			end
		end
	end
end
