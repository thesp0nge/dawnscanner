module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-12-17
			class CVE_2013_1812
				include DependencyCheck

				def initialize
          message = "The ruby-openid gem before 2.2.2 for Ruby allows remote OpenID providers to cause a denial of service (CPU consumption) via (1) a large XRDS document or (2) an XML Entity Expansion (XEE) attack."

           super({
            :name=>'CVE-2013-1812', 
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:N/A:P",  
            :release_date => Date.new(2013, 12, 12),
            :cwe=>"399", 
            :owasp=>"A9",
            :applies=>["rails", "padrino", "sinatra"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade ruby-openid rubygem",
            :aux_links => ["http://www.openwall.com/lists/oss-security/2013/03/03/8"]
          })
          self.safe_dependencies = [{:name=>"ruby-openid", :version=>['2.2.2']}]

				end
			end
		end
	end
end
