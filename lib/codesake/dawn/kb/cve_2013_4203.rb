module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-03-28
			class CVE_2013_4203
				include DependencyCheck

				def initialize
          message = "The self.run_gpg function in lib/rgpg/gpg_helper.rb in the rgpg gem before 0.2.3 for Ruby allows remote attackers to execute arbitrary commands via shell metacharacters in unspecified vectors."
           super({
            :name=>"CVE-2013-4203",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 10, 11),
            :cwe=>"94",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rgpg at least to version 0.2.3. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://www.openwall.com/lists/oss-security/2013/08/03/2"]
           })
           self.safe_dependencies = [{:name=>"rgpg", :version=>['0.2.3']}]
				end
			end
		end
	end
end
