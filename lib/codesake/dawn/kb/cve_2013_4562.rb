module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-11-26
			class CVE_2013_4562
				include DependencyCheck

				def initialize
          message = "Because of the way that omniauth-facebook supports setting a per-request state parameter by storing it in the session, it is possible to circumvent the automatic CSRF protection. Therefore the CSRF added in 1.4.1 should be considered broken. If you are currently providing a custom state, you will need to store and retrieve this yourself (for example, by using the session store) to use 1.5.0."
          super({
            :name=>"CVE-2013-4562",
            :cvss=>"not assigned",
            :release_date => Date.new(2013, 11, 14),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"You must upgrade at least to 1.5.0 or later",
            :aux_links=>["https://groups.google.com/forum/#!msg/ruby-security-ann/-tJHNlTiPh4/9SJxdEWLIawJ"]
          })

          self.safe_dependencies = [{:name=>"omniauth-facebook", :version=>['1.5.0']}]

				end
			end
		end
	end
end
