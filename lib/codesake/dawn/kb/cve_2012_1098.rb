module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-14
			class CVE_2012_1098
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in Ruby on Rails 3.0.x before 3.0.12, 3.1.x before 3.1.4, and 3.2.x before 3.2.2 allows remote attackers to inject arbitrary web script or HTML via vectors involving a SafeBuffer object that is manipulated through certain methods."

          super({
            :name=>"CVE-2012-1098",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2012, 3, 13),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.0.12, 3.1.4 and 3.2.2. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2012/3/1/ann-rails-3-0-12-has-been-released"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.0.12', '3.1.4', '3.2.2']}]
          self.save_major = true


				end
			end
		end
	end
end
