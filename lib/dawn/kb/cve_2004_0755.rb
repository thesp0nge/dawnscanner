module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-06
			class CVE_2004_0755
				include RubyVersionCheck

				def initialize
          message = "The FileStore capability in CGI::Session for Ruby before 1.8.1, and possibly PStore, creates files with insecure permissions, which can allow local users to steal session information and hijack sessions."

          super({
            :name=>"CVE-2004-0755",
            :cvss=>"AV:L/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2004, 10, 20),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://xforce.iss.net/xforce/xfdb/16996"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.8.999", :patchlevel=>"p0"}, {:engine=>"ruby", :version=>"1.6.999", :patchlevel=>"p0"}]



				end
			end
		end
	end
end
