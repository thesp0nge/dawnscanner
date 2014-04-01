module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-06
			class CVE_2013_4593
				include DependencyCheck

				def initialize
          message = "omniauth-facebook Gem for Ruby contains a flaw that is due to the application supporting passing the access token via the URL. This may allow a remote attacker to bypass authentication and authenticate as another user."

          super({
            :name=>"CVE-2013-4593",
            :cvss=>"",
            :release_date => Date.new(2013, 11, 14),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade omniauth-facebook version to version 1.5.1 or higher.",
            :aux_links=>["http://seclists.org/oss-sec/2013/q4/309"]
          })

          self.safe_dependencies = [{:name=>"omniauth-facebook", :version=>['1.5.1']}]
				end
			end
		end
	end
end
