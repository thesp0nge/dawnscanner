module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-06
			class CVE_2012_6496
				include DependencyCheck

				def initialize
          message = "SQL injection vulnerability in the Active Record component in Ruby on Rails before 3.0.18, 3.1.x before 3.1.9, and 3.2.x before 3.2.10 allows remote attackers to execute arbitrary SQL commands via a crafted request that leverages incorrect behavior of dynamic finders in applications that can use unexpected data types in certain find_by_ method calls."

          super({
            :name=>"CVE-2012-6496",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 1, 4),
            :cwe=>"200",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.2.10, 3.1.9 or 3.0.18. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/d/topic/rubyonrails-security/DCNTNp_qjFM/discussion"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.0.18', '3.2.10', '3.1.9']}]

				end
			end
		end
	end
end
