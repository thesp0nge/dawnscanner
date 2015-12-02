module Dawn
		module Kb
			# Automatically created with rake on 2015-12-01
			class OSVDB_120415
				include DependencyCheck

				def initialize
          title = "redcarpet Gem for Ruby markdown.c parse_inline() Function XSS"
          message = "redcarpet gem for Ruby contains a flaw that allows a cross-site scripting (XSS) attack. This flaw exists because the parse_inline() function in markdown.c does not validate input before returning it to users. This may allow a remote attacker to create a specially crafted request that would execute arbitrary script code in a user's browser session within the trust relationship between their browser and the server."

          super({
            :title=>title,
            :name=> "OSVDB_120415",
            :cve=>"",
            :osvdb=>"120415",
            :cvss=>"",
            :release_date => Date.new(2015, 4, 7),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade redcarpet gem to version 3.2.3 or later.",
            :aux_links=>[""]
           })
          self.safe_dependencies = [{:name=>"redcarpet", :version=>['3.2.3']}]

				end
			end
		end
end
