module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-31
			class CVE_2012_6134
				include DependencyCheck

				def initialize
          message="Cross-site request forgery (CSRF) vulnerability in the omniauth-oauth2 gem 1.1.1 and earlier for Ruby allows remote attackers to hijack the authentication of users for requests that modify session state."
          super({
            :name=>"CVE-2012-6134",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 4, 9),
            :cwe=>"352",
            :owasp=>"A8", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade omniauth-oauth2 version to the latest one",
            :aux_links=>["https://github.com/intridea/omniauth-oauth2/pull/25"]
          })

          self.safe_dependencies = [{:name=>"omniauth-oauth2", :version=>['1.1.2']}]

				end
			end
		end
	end
end
