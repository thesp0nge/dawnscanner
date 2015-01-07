module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-30
			class CVE_2011_2197
				include DependencyCheck

				def initialize
          message="The cross-site scripting (XSS) prevention feature in Ruby on Rails 2.x before 2.3.12, 3.0.x before 3.0.8, and 3.1.x before 3.1.0.rc2 does not properly handle mutation of safe buffers, which makes it easier for remote attackers to conduct XSS attacks via crafted strings to an application that uses a problematic string method, as demonstrated by the sub method."
          super({
            :name=>"CVE-2011-2197",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2011, 6, 30),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.12, 3.0.8, 3.1.0. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2011/6/8/potential-xss-vulnerability-in-ruby-on-rails-applications"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.12', '3.0.8', '3.1.0']}]

				end
			end
		end
	end
end
