module Dawn
		module Kb
			# Automatically created with rake on 2015-12-02
			class OSVDB_117903
				include DependencyCheck

				def initialize
          title = "ruby-saml URI SAML Response Handling Remote Command Execution"
          message = "ruby-saml contains a flaw that is triggered as the URI value of a SAML response is not properly sanitized through a prepared statement. This may allow a remote attacker to execute arbitrary shell commands on the host machine."
           super({
            :title=>title,
            :name=> "OSVDB_117903",
            :cve=>"",
            :osvdb=>"117903",
            :cvss=>"",
            :release_date => Date.new(2015, 1, 7),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby-saml gem to version 0.8.2 or later.",
            :aux_links=>["https://security.dxw.com/advisories/publicly-exploitable-command-injection-in-ruby-saml-0-7-2-library-can-root-the-host/"]
           })
           self.safe_dependencies = [{:name=>"ruby-saml", :version=>['0.8.2', '0.7.3']}]

				end
			end
		end
end
