module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-08
			class CVE_2011_2930
				include DependencyCheck

				def initialize
          message = "Multiple SQL injection vulnerabilities in the quote_table_name method in the ActiveRecord adapters in activerecord/lib/active_record/connection_adapters/ in Ruby on Rails before 2.3.13, 3.0.x before 3.0.10, and 3.1.x before 3.1.0.rc5 allow remote attackers to execute arbitrary SQL commands via a crafted column name."
          super({
            :name=>"CVE-2011-2930",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2011, 8, 29),
            :cwe=>"89",
            :owasp=>"A1", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails to version 2.3.13, 3.0.10 and 3.1.1. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["http://groups.google.com/group/rubyonrails-security/msg/b1a85d36b0f9dd30?dmode=source&output=gplain"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.13', '3.0.10', '3.1.1']}]
          self.save_major = true

				end
			end
		end
	end
end
