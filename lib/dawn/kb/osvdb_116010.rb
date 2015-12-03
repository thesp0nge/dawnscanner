module Dawn
		module Kb
			# Automatically created with rake on 2015-12-03
			class OSVDB_116010
				include DependencyCheck

				def initialize
          title = "Doorkeeper Gem for Ruby access_token Disclosure CSRF"
          message = "Cross-site request forgery (CSRF) vulnerability in doorkeeper before 1.4.1 allows remote attackers to hijack the authentication of unspecified victims for requests that read a user OAuth authorization code via unknown vectors."
          super({
            :title=>title,
            :name=> "OSVDB_116010",
            :cve=>"CVE-2014-8144",
            :osvdb=>"116010",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2014, 12, 31),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade doorkeeper gem to version 1.4.1 or later.",
            :aux_links=>[""]
           })
          self.safe_dependencies = [{:name=>"doorkeeper", :version=>['1.4.1']}]

				end
			end
		end
end
