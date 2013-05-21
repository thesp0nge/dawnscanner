module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-16
			class CVE_2013_1854
				include DependencyCheck

				def initialize
          message = "The Active Record component in Ruby on Rails 2.3.x before 2.3.18, 3.1.x before 3.1.12, and 3.2.x before 3.2.13 processes certain queries by converting hash keys to symbols, which allows remote attackers to cause a denial of service via crafted input to a where method."
          
          super({
            :name=>'CVE-2013-1854', 
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",  
            :release_date => Date.new(2013, 3, 19),
            :cwe=>"20", 
            :owasp=>"A9",
            :applies=>["rails"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade rails version at least to 2.3.18, 3.1.12 and 3.2.13. As a general rule, using the latest stable rails version is recommended.",
            :aux_links => ["https://groups.google.com/group/ruby-security-ann/msg/34e0d780b04308de?dmode=source&output=gplain"]
          })
          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.18', '3.2.13', '3.1.12']}]
				end
			end
		end
	end
end
