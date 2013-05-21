module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-20
			class CVE_2013_1655
				include DependencyCheck

				def initialize
          message = "Puppet 2.7.x before 2.7.21 and 3.1.x before 3.1.1, when running Ruby 1.9.3 or later, allows remote attackers to execute arbitrary code via vectors related to \"serialized attributes.\""

          super({
            :name=>"CVE-2013-1655",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 3, 20),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade puppet gem to a newer version",
            :aux_links=>["https://puppetlabs.com/security/cve/cve-2013-1655/"],
            :ruby_vulnerable_versions =>['1.9.3', '2.0.0']
          })

          self.safe_dependencies = [{:name=>"puppet", :version=>['2.7.21', '3.1.1']}]

				end
			end
		end
	end
end
