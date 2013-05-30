module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-30
			class CVE_2012_2140
				include DependencyCheck

				def initialize
          message = "The Mail gem before 2.4.3 for Ruby allows remote attackers to execute arbitrary commands via shell metacharacters in a (1) sendmail or (2) exim delivery."
          super({
            :name=>"CVE-2012-2140",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2012, 7, 18),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade Mail gem version to version 2.4.3. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["http://secunia.com/advisories/48970"]
          })

          self.safe_dependencies = [{:name=>"mail_gem", :version=>['2.4.3', '2.3.4']}]

				end
			end
		end
	end
end
