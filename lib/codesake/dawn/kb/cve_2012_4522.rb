module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-07-15
			class CVE_2012_4522
				include RubyVersionCheck

				def initialize
          message = "The rb_get_path_check function in file.c in Ruby 1.9.3 before patchlevel 286 and Ruby 2.0.0 before r37163 allows context-dependent attackers to create files in unexpected locations or with unexpected names via a NUL byte in a file path."
           super({
            :name=>"CVE-2012-4522",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2012, 11, 24),
            :cwe=>"264",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade ruby interpreter to latest 1.9.3 patchset or even better use ruby 2.x",
            :aux_links=>["http://www.ruby-lang.org/en/news/2012/10/12/poisoned-NUL-byte-vulnerability/"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p286"}, {:engine=>"ruby", :version=>"2.0.0", :patchlevel=>"p0"}]

				end
			end
		end
	end
end
