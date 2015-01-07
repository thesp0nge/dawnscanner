module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2008_3905
				include RubyVersionCheck

				def initialize
          message = "resolv.rb in Ruby 1.8.5 and earlier, 1.8.6 before 1.8.6-p287, 1.8.7 before 1.8.7-p72, and 1.9 r18423 and earlier uses sequential transaction IDs and constant source ports for DNS requests, which makes it easier for remote attackers to spoof DNS responses, a different vulnerability than CVE-2008-1447."
          super({
            :name=>"CVE-2008-3905",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:P",
            :release_date => Date.new(2008, 9, 4),
            :cwe=>"287",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www.ruby-lang.org/en/news/2008/08/08/multiple-vulnerabilities-in-ruby/"]
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.9.0", :patchlevel=>"p0"}, 
            {:engine=>"ruby", :version=>"1.8.6", :patchlevel=>"p287"}, 
            {:engine=>"ruby", :version=>"1.8.5", :patchlevel=>"p999"}, 
            {:engine=>"ruby", :version=>"1.8.4", :patchlevel=>"p999"}, 
            {:engine=>"ruby", :version=>"1.8.3", :patchlevel=>"p999"}, 
            {:engine=>"ruby", :version=>"1.8.2", :patchlevel=>"p999"}, 
            {:engine=>"ruby", :version=>"1.8.1", :patchlevel=>"p999"}, 
            {:engine=>"ruby", :version=>"1.8.0", :patchlevel=>"p999"}, 
            {:engine=>"ruby", :version=>"1.6.999", :patchlevel=>"p0"}]

				end
			end
		end
	end
end
