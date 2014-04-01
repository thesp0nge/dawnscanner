module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-06
			class CVE_2013_0184
				include DependencyCheck

				def initialize
          message = "Unspecified vulnerability in Rack::Auth::AbstractRequest in Rack 1.1.x before 1.1.5, 1.2.x before 1.2.7, 1.3.x before 1.3.9, and 1.4.x before 1.4.4 allows remote attackers to cause a denial of service via unknown vectors related to \"symbolized arbitrary strings.\""
          super({
            :name=>"CVE-2013-0184",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2013, 3, 1),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rack version up to version 1.4.4, 1.3.9, 1.2.7, 1.1.5 or higher.",
            :aux_links=>["https://bugzilla.redhat.com/show_bug.cgi?id=895384"]
          })
          self.safe_dependencies = [{:name=>"rack", :version=>['1.4.4', '1.3.9', '1.2.7', '1.1.5']}]
				end
			end
		end
	end
end
