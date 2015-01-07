module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-17
			class CVE_2013_0277
				include DependencyCheck

				def initialize
          message = "ActiveRecord in Ruby on Rails before 2.3.17 and 3.x before 3.1.0 allows remote attackers to cause a denial of service or execute arbitrary code via crafted serialized attributes that cause the +serialize+ helper to deserialize arbitrary YAML."
          super({
            :name=>'CVE-2013-0277', 
            :cvss=>"AV:N/AC:L/Au:N/C:C/I:C/A:C",  
            :release_date => Date.new(2013, 2, 13),
            :cwe=>"", 
            :owasp=>"A9",
            :applies=>["rails"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade rails version at least to 2.3.17 and 3.1.0. As a general rule, using the latest stable rails version is recommended.",
            :aux_links => ["https://groups.google.com/group/ruby-security-ann/msg/34e0d780b04308de?dmode=source&output=gplain"]
          })
          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.17', '3.0.9999999', '3.1.0']}]
				end
			end
		end
	end
end
