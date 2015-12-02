module Dawn
		module Kb
			# Automatically created with rake on 2015-12-02
			class OSVDB_120857
				# Include the testing skeleton for this Security Check
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          title = "refile Gem for Ruby remote_image_url Attachment Remote Command Execution"
          message = "refile Gem for Ruby contains a flaw that is triggered when input is not sanitized when handling the 'remote_image_url' field in a form, where 'image' is the name of the attachment. This may allow a remote attacker to execute arbitrary shell commands."

          super({
            :title=>title,
            :name=> "OSVDB_120857",
            :cve=>"",
            :osvdb=>"120857",
            :cvss=>"",
            :release_date => Date.new(2015, 4, 15),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade refile gem to version 0.5.4 or later.",
            :aux_links=>[""]
           })
          self.save_minor = true
          self.safe_dependencies=[{:name=>"refile", :version=>['0.5.4', '0.4.-1', '0.3.-1', '0.2.-1', '0.1.-1']}]
				end
			end
		end
end
