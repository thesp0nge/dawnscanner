	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-08
			class CVE_2011_4319
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in the i18n translations helper method in Ruby on Rails 3.0.x before 3.0.11 and 3.1.x before 3.1.2, and the rails_xss plugin in Ruby on Rails 2.3.x, allows remote attackers to inject arbitrary web script or HTML via vectors related to a translations string whose name ends with an \"html\" substring."

          super({
            :name=>"CVE-2011-4319",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2011, 11, 28),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails to version 3.0.11, 3.1.2 or a version up to 2.3.12 if you are stuck on 2.3.x branch . As a general rule, using the latest stable version is recommended.",
            :aux_links=>["http://groups.google.com/group/rubyonrails-security/msg/c65c24fbc4b6dd82?dmode=source&output=gplain"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.13', '3.0.11', '3.1.2']}]
          self.save_major = true
          self.save_minor = true

				end
			end
		end
	end
