module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-21
			class CVE_2013_0233
				include DependencyCheck

				def initialize
          message = "Devise gem 2.2.x before 2.2.3, 2.1.x before 2.1.3, 2.0.x before 2.0.5, and 1.5.x before 1.5.4 for Ruby, when using certain databases, does not properly perform type conversion when performing database queries, which might allow remote attackers to cause incorrect results to be returned and bypass security checks via unknown vectors, as demonstrated by resetting passwords of arbitrary accounts."
          super({
            :name=>"CVE-2013-0233",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 4, 25),
            :cwe=>"399",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade Devise gem to version 2.2.3, 2.1.3, 2.0.5, 1.5.4 or latest version available",
            :aux_links=>["http://blog.plataformatec.com.br/2013/01/security-announcement-devise-v2-2-3-v2-1-3-v2-0-5-and-v1-5-3-released/"]
          })

          self.safe_dependencies = [{:name=>"devise", :version=>['1.5.4', '2.0.5', '2.1.3', '2.2.3']}]
				end
			end
		end
	end
end
