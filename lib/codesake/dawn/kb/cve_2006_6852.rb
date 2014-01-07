module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-07
			class CVE_2006_6852
				include DependencyCheck

				def initialize
          message = "Eval injection vulnerability in tDiary 2.0.3 and 2.1.4.20061127 allows remote authenticated users to execute arbitrary Ruby code via unspecified vectors, possibly related to incorrect input validation by (1) conf.rhtml and (2) i.conf.rhtml. NOTE: some of these details are obtained from third party information."
          super({
            :name=>"CVE-2006-6852",
            :cvss=>"AV:N/AC:M/Au:S/C:P/I:P/A:P",
            :release_date => Date.new(2006, 12, 31),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade tdiary version to the latest version.",
            :aux_links=>["http://www.tdiary.org/20061210.html"]
          })

          self.safe_dependencies = [{:name=>"tdiary", :version=>['2.0.4', '2.1.5']}]

				end
			end
		end
	end
end
