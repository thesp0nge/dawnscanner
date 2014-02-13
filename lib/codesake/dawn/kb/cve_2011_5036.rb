module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-06
			class CVE_2011_5036
				include DependencyCheck

				def initialize
          message = "Rack before 1.1.3, 1.2.x before 1.2.5, and 1.3.x before 1.3.6 computes hash values for form parameters without restricting the ability to trigger hash collisions predictably, which allows remote attackers to cause a denial of service (CPU consumption) by sending many crafted parameters."

          super({
            :name=>"CVE-2011-5036",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2011, 12, 30),
            :cwe=>"310",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rack version up to version 1.3.6, 1.2.5, 1.1.3 or higher.",
            :aux_links=>["https://gist.github.com/52bbc6b9cc19ce330829"]
          })
          self.safe_dependencies = [{:name=>"rack", :version=>['1.3.6', '1.2.5', '1.1.3', '1.0.9999', '0.9.9999', '0.4.9999', '0.3.9999', '0.2.9999', '0.1.9999']}]
				end
			end
		end
	end
end
