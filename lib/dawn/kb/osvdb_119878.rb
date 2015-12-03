module Dawn
		module Kb
			# Automatically created with rake on 2015-04-04
			class OSVDB_119878
				# Include the testing skeleton for this Security Check
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          message="ret-client Gem for Ruby contains a flaw in abstract_response.rb related to the handling of set-cookie headers in redirection responses that allows a remote, user-assisted attacker to conduct a session fixation attack. This flaw exists because the application, when establishing a new session, does not invalidate an existing session identifier and assign a new one. With a specially crafted request fixating the session identifier, a context-dependent attacker can ensure a user authenticates with the known session identifier, allowing the session to be subsequently hijacked."

          super({
            :name=> "OSVDB_119878",
            :cve=>"2015-1820",
            :osvdb=>"119878",
            :cvss=>"",
            :release_date => Date.new(2015, 3, 24),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rest-client gem version to 2.0.0.rc1 or later.",
            :aux_links=>[""]
           })
          self.safe_dependencies = [{:name=>"rest-client", :version=>['2.0.0.rc1']}]

				end
			end
		end
end
