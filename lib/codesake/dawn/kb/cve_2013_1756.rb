module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-15
			class CVE_2013_1756
				include DependencyCheck

				def initialize
          message = "Dragonfly Gem for Ruby contains a flaw that is triggered during the parsing of a specially crafted request. This may allow a remote attacker to execute arbitrary code."
          super({
            :name=>'CVE-2013-1756', 
            :cvss=>"",  
            :release_date => Date.new(2013, 2, 19),
            :cwe=>"20", 
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade dragonfly gem to 0.9.13. However the maintainer suggests upgrading to 0.9.14 since it fix another non security related bug",
            :aux_links => ["http://www.osvdb.com/show/osvdb/90647"]
          })
          self.safe_dependencies = [{:name=>"dragonfly", :version=>['0.9.13']}]

				end
			end
		end
	end
end
