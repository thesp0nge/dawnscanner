module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-07
			class CVE_2006_5467
				include RubyVersionCheck

				def initialize
          message = "The cgi.rb CGI library for Ruby 1.8 allows remote attackers to cause a denial of service (infinite loop and CPU consumption) via an HTTP request with a multipart MIME body that contains an invalid boundary specifier, as demonstrated using a specifier that begins with a \"-\" instead of \"--\" and contains an inconsistent ID."

           super({
            :name=>"CVE-2006-5467",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2006, 10, 27),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www.securityfocus.com/bid/20777"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.9.0", :patchlevel=>"p0"}]

				end
			end
		end
	end
end
