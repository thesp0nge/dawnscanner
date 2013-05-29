module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-29
			class CVE_2011_0447
				include DependencyCheck

				def initialize
          message = "Ruby on Rails 2.1.x, 2.2.x, and 2.3.x before 2.3.11, and 3.x before 3.0.4, does not properly validate HTTP requests that contain an X-Requested-With header, which makes it easier for remote attackers to conduct cross-site request forgery (CSRF) attacks via forged (1) AJAX or (2) API requests that leverage \"combinations of browser plugins and HTTP redirects,\" a related issue to CVE-2011-0696."

          super({
            :name=>"CVE-2011-0447",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2011, 2, 14),
            :cwe=>"352",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.11 or 3.0.4. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2011/2/8/csrf-protection-bypass-in-ruby-on-rails"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.1.9999', '2.2.9999', '2.3.11', '3.0.4']}]
 
				end
			end
		end
	end
end
