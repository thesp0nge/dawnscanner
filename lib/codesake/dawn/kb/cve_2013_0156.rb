module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-17
			class CVE_2013_0156
				include DependencyCheck

				def initialize
          message = "active_support/core_ext/hash/conversions.rb in Ruby on Rails before 2.3.15, 3.0.x before 3.0.19, 3.1.x before 3.1.10, and 3.2.x before 3.2.11 does not properly restrict casts of string values, which allows remote attackers to conduct object-injection attacks and execute arbitrary code, or cause a denial of service (memory and CPU consumption) involving nested XML entity references, by leveraging Action Pack support for (1) YAML type conversion or (2) Symbol type conversion."

         super({
            :name=>'CVE-2013-0156', 
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",  
            :release_date => Date.new(2013, 1, 13),
            :cwe=>"20", 
            :owasp=>"A9",
            :applies=>["rails"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade rails version at least to 2.3.15, 3.0.19, 3.1.10 and 3.2.11. As a general rule, using the latest stable rails version is recommended.",
            :aux_links => ["https://groups.google.com/group/rubyonrails-security/msg/c1432d0f8c70e89d?dmode=source&output=gplain"]
          })
          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.15', '3.0.19', '3.2.11', '3.1.10']}]
 
				end
			end
		end
	end
end
