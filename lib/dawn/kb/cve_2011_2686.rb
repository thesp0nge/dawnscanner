module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-08
			class CVE_2011_2686
				include RubyVersionCheck

				def initialize
          message = "Ruby before 1.8.7-p352 does not reset the random seed upon forking, which makes it easier for context-dependent attackers to predict the values of random numbers by leveraging knowledge of the number sequence obtained in a different child process, a related issue to CVE-2003-0900. NOTE: this issue exists because of a regression during Ruby 1.8.6 development."

          super({
            :name=>"CVE-2011-2686",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2011, 8, 5),
            :cwe=>"264",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby interpreter to 1.8.7-p352 or latest version available",
            :aux_links=>["http://www.ruby-lang.org/en/news/2011/07/02/ruby-1-8-7-p352-released/"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p352"}]


				end
			end
		end
	end
end
