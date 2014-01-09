module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2008_7248
				include DependencyCheck

				def initialize
          message = "Ruby on Rails 2.1 before 2.1.3 and 2.2.x before 2.2.2 does not verify tokens for requests with certain content types, which allows remote attackers to bypass cross-site request forgery (CSRF) protection for requests to applications that rely on this protection, as demonstrated using text/plain."
          super({
            :name=>"CVE-2008-7248",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2009, 12, 16),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.1.3 or 2.2.2 or higher. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://groups.google.com/group/rubyonrails-security/browse_thread/thread/d741ee286e36e301?hl=en"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.1.3', '2.2.2']}]

				end
			end
		end
	end
end
