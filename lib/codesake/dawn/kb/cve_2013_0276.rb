module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-16
			class CVE_2013_0276
				include DependencyCheck

				def initialize
          message = "ActiveRecord in Ruby on Rails before 2.3.17, 3.1.x before 3.1.11, and 3.2.x before 3.2.12 allows remote attackers to bypass the attr_protected protection mechanism and modify protected model attributes via a crafted request."
          
          super({
            :name=>'CVE-2013-0276', 
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",  
            :release_date => Date.new(2013, 2, 13),
            :cwe=>"264", 
            :owasp=>"A9",
            :applies=>["rails"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade rails version at least to 2.3.17, 3.1.11 and 3.2.12. As a general rule, using the latest stable rails version is recommended.",
            :aux_links => ["https://groups.google.com/group/rubyonrails-security/msg/bb44b98a73ef1a06?dmode=source&output=gplain"]
          })
          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.17', '3.2.12', '3.1.11']}]


				end
			end
		end
	end
end
