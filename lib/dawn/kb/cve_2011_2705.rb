module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-08
			class CVE_2011_2705
				include RubyVersionCheck

				def initialize
          message = "The SecureRandom.random_bytes function in lib/securerandom.rb in Ruby before 1.8.7-p352 and 1.9.x before 1.9.2-p290 relies on PID values for initialization, which makes it easier for context-dependent attackers to predict the result string by leveraging knowledge of random strings obtained in an earlier process with the same PID."

          super({
            :name=>"CVE-2011-2705",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2011, 8, 5),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby interpreter to 1.8.7-p352 or 1.9.2-p290 or latest version available",
            :aux_links=>["http://www.ruby-lang.org/en/news/2013/02/22/rexml-dos-2013-02-22/"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p352"}, 
                              {:engine=>"ruby", :version=>"1.9.0", :patchlevel=>"p999"},
                              {:engine=>"ruby", :version=>"1.9.1", :patchlevel=>"p999"},
                              {:engine=>"ruby", :version=>"1.9.2", :patchlevel=>"p290"}
          ]

				end
			end
		end
	end
end
