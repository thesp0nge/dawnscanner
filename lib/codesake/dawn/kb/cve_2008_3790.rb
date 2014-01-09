module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2008_3790
				include RubyVersionCheck

				def initialize
          message = "The REXML module in Ruby 1.8.6 through 1.8.6-p287, 1.8.7 through 1.8.7-p72, and 1.9 allows context-dependent attackers to cause a denial of service (CPU consumption) via an XML document with recursively nested entities, aka an \"XML entity explosion.\""
          super({
            :name=>"CVE-2008-3790",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2008, 8, 27),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www.ruby-lang.org/en/news/2008/08/23/dos-vulnerability-in-rexml/"]
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p73"}, 
            {:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p73"}, 
            {:engine=>"ruby", :version=>"1.9.0", :patchlevel=>"p1"} 
          ]
				end
			end
		end
	end
end
