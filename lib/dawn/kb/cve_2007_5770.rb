module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2007_5770
				include RubyVersionCheck

				def initialize
          message = "The (1) Net::ftptls, (2) Net::telnets, (3) Net::imap, (4) Net::pop, and (5) Net::smtp libraries in Ruby 1.8.5 and 1.8.6 do not verify that the commonName (CN) field in a server certificate matches the domain name in a request sent over SSL, which makes it easier for remote attackers to intercept SSL transmissions via a man-in-the-middle attack or spoofed web site, different components than CVE-2007-5162."
          super({
            :name=>"CVE-2007-5770",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2007, 11, 14),
            :cwe=>"22",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=rev&revision=13656"]
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.8.6", :patchlevel=>"p999"}, 
            {:engine=>"ruby", :version=>"1.8.5", :patchlevel=>"p999"}
          ]

				end
			end
		end
	end
end
