module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-06
			class CVE_2006_1931
				include RubyVersionCheck

				def initialize
          message = "The HTTP/XMLRPC server in Ruby before 1.8.2 uses blocking sockets, which allows attackers to cause a denial of service (blocked connections) via a large amount of data."
          super({
            :name=>"CVE-2006-1931",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2005, 06, 20),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www.securityfocus.com/bid/17645"]
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.8.3", :patchlevel=>"p0"},
            {:engine=>"ruby", :version=>"1.6.8", :patchlevel=>"p0"}
          ]

				end
			end
		end
	end
end
