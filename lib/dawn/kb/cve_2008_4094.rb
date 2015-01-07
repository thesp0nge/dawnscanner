module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2008_4094
				include DependencyCheck

				def initialize
          message = "Multiple SQL injection vulnerabilities in Ruby on Rails before 2.1.1 allow remote attackers to execute arbitrary SQL commands via the (1) :limit and (2) :offset parameters, related to ActiveRecord, ActiveSupport, ActiveResource, ActionPack, and ActionMailer."
          super({
            :name=>"CVE-2008-4094",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2008, 9, 30),
            :cwe=>"89",
            :owasp=>"A1", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.1.1 or higher. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2006/8/10/rails-1-1-6-backports-and-full-disclosure"]
          })


          self.safe_dependencies = [{:name=>"rails", :version=>['2.1.1', '2.0.999', '1.9.999', '1.2.999', '1.1.999', '0.999.999']}]
				end
			end
		end
	end
end
