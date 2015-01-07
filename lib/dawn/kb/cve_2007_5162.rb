module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2007_5162
				include RubyVersionCheck

				def initialize
          message = "The connect method in lib/net/http.rb in the (1) Net::HTTP and (2) Net::HTTPS libraries in Ruby 1.8.5 and 1.8.6 does not verify that the commonName (CN) field in a server certificate matches the domain name in an HTTPS request, which makes it easier for remote attackers to intercept SSL transmissions via a man-in-the-middle attack or spoofed web site."

          super({
            :name=>"CVE-2007-5162",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2007, 10, 1),
            :cwe=>"287",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=rev&revision=13504"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.8.5", :patchlevel=>"p999"}, {:engine=>"ruby", :version=>"1.8.6", :patchlevel=>"p999"}]

				end
			end
		end
	end
end
