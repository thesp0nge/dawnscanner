module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2008_3657
				include RubyVersionCheck

				def initialize
          message = "The dl module in Ruby 1.8.5 and earlier, 1.8.6 through 1.8.6-p286, 1.8.7 through 1.8.7-p71, and 1.9 through r18423 does not check \"taintness\" of inputs, which allows context-dependent attackers to bypass safe levels and execute dangerous functions by accessing a library using DL.dlopen."
          
          super({
            :name=>"CVE-2008-3657",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2008, 8, 13),
            :cwe=>"20",
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
