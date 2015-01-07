module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-08
			class CVE_2011_1004
				include RubyVersionCheck

				def initialize
          message = "The FileUtils.remove_entry_secure method in Ruby 1.8.6 through 1.8.6-420, 1.8.7 through 1.8.7-330, 1.8.8dev, 1.9.1 through 1.9.1-430, 1.9.2 through 1.9.2-136, and 1.9.3dev allows local users to delete arbitrary files via a symlink attack."
          super({
            :name=>"CVE-2011-1004",
            :cvss=>"AV:L/AC:M/Au:N/C:N/I:C/A:C",
            :release_date => Date.new(2011, 3, 2),
            :cwe=>"59",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby interpreter up to the latest version available",
            :aux_links=>["ihttp://www.ruby-lang.org/en/news/2011/02/18/fileutils-is-vulnerable-to-symlink-race-attacks/"]
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.8.6", :patchlevel=>"p421"},
            {:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p331"},
            {:engine=>"ruby", :version=>"1.8.8", :patchlevel=>"p0"},
            {:engine=>"ruby", :version=>"1.9.1", :patchlevel=>"p431"},
            {:engine=>"ruby", :version=>"1.9.2", :patchlevel=>"p137"},
            {:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p0"},
          ]

				end
			end
		end
	end
end
