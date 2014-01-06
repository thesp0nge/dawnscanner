module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-06
			class CVE_2004_0983
				include RubyVersionCheck

				def initialize
          message = "The CGI module in Ruby 1.6 before 1.6.8, and 1.8 before 1.8.2, allows remote attackers to cause a denial of service (infinite loop and CPU consumption) via a certain HTTP request." 
          super({
            :name=>"CVE-2004-0983",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2005, 03, 01),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://xforce.iss.net/xforce/xfdb/17985"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.8.3", :patchlevel=>"p0"}, {:engine=>"ruby", :version=>"1.6.7", :patchlevel=>"p0"}]


				end
			end
		end
	end
end
