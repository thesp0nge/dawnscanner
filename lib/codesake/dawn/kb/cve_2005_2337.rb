module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-06
			class CVE_2005_2337
				include RubyVersionCheck

				def initialize
          message="Ruby 1.6.x up to 1.6.8, 1.8.x up to 1.8.2, and 1.9.0 development up to 2005-09-01 allows attackers to bypass safe level and taint flag protections and execute disallowed code when Ruby processes a program through standard input (stdin)."
          super({
            :name=>"CVE-2005-2337",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2005, 10, 07),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www.ruby-lang.org/en/20051003.html"]
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.6.8", :patchlevel=>"p0"}, 
            {:engine=>"ruby", :version=>"1.8.3", :patchlevel=>"p0"}, 
          ]

				end
			end
		end
	end
end
