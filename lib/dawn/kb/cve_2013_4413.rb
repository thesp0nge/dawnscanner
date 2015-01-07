module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-05
			class CVE_2013_4413
				include DependencyCheck

				def initialize
          message = "Wicked Gem for Ruby contains a flaw that is due to the program failing to properly sanitize input passed via the 'the_step' parameter upon submission to the render_redirect.rb script. This may allow a remote attacker to gain access to arbitrary files."

          super({
            :name=>"CVE-2013-4413",
            :cvss=>"",
            :release_date => Date.new(2013, 10, 8),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade wicked version up to version 1.0.1.",
            :aux_links=>["http://schneems.com/post/63478235238/wicked-1-0-1-released-with-critical-security-fix"]
          })

          self.safe_dependencies = [{:name=>"wicked", :version=>['1.0.1']}]
				end
			end
		end
	end
end
