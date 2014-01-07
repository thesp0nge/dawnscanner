module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-07
			class CVE_2006_6303
				include RubyVersionCheck

				def initialize
          message = "The read_multipart function in cgi.rb in Ruby before 1.8.5-p2 does not properly detect boundaries in MIME multipart content, which allows remote attackers to cause a denial of service (infinite loop) via crafted HTTP requests, a different issue than CVE-2006-5467."

          super({
            :name=>"CVE-2006-6303",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2006, 12, 6),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www.ruby-lang.org/en/news/2006/12/04/another-dos-vulnerability-in-cgi-library/"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.8.6", :patchlevel=>"p0"}]

				end
			end
		end
	end
end
