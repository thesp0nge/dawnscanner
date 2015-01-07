module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-27
			class CVE_2013_3221
				include DependencyCheck

				def initialize
          message = "The Active Record component in Ruby on Rails 2.3.x, 3.0.x, 3.1.x, and 3.2.x does not ensure that the declared data type of a database column is used during comparisons of input values to stored values in that column, which makes it easier for remote attackers to conduct data-type injection attacks against Ruby on Rails applications via a crafted value, as demonstrated by unintended interaction between the \"typed XML\" feature and a MySQL database."
           super({
            :name=>"CVE-2013-3221",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:N",
            :release_date => Date.new(2013, 4, 22),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.16, 3.2.9, 3.1.9 or 3.0.21. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/group/rubyonrails-security/msg/1f3bc0b88a60c1ce?dmode=source&output=gplain"]
          })

          self.safe_dependencies = [{:name=>"railse", :version=>['2.3.16', '3.2.9', '3.1.9', '3.0.21']}]

				end
			end
		end
	end
end
