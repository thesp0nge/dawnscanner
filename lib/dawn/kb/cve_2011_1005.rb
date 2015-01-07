module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-08
			class CVE_2011_1005
				include RubyVersionCheck

				def initialize
          message = "The safe-level feature in Ruby 1.8.6 through 1.8.6-420, 1.8.7 through 1.8.7-330, and 1.8.8dev allows context-dependent attackers to modify strings via the Exception#to_s method, as demonstrated by changing an intended pathname."
          super({
            :name=>"CVE-2011-1005",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2011, 3, 2),
            :cwe=>"264",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby interpreter up to 1.8.6-p420, up to 1.8.7-p330 or latest version available",
            :aux_links=>["http://www.ruby-lang.org/en/news/2011/02/18/exception-methods-can-bypass-safe/"]
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.8.6", :patchlevel=>"p421"},
            {:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p331"},
            {:engine=>"ruby", :version=>"1.8.8", :patchlevel=>"p0"}
          ]

				end
			end
		end
	end
end
