module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-08
			class CVE_2011_3009
				include RubyVersionCheck

				def initialize
          message = "Ruby before 1.8.6-p114 does not reset the random seed upon forking, which makes it easier for context-dependent attackers to predict the values of random numbers by leveraging knowledge of the number sequence obtained in a different child process, a related issue to CVE-2003-0900."

          super({
            :name=>"CVE-2011-3009",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2011, 8, 11),
            :cwe=>"310",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www.openwall.com/lists/oss-security/2011/07/20/1"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.8.6", :patchlevel=>"p112"}]

				end
			end
		end
	end
end
