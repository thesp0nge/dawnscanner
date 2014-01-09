module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2008_1145
				include RubyVersionCheck

				def initialize
          message = "Directory traversal vulnerability in WEBrick in Ruby 1.8 before 1.8.5-p115 and 1.8.6-p114, and 1.9 through 1.9.0-1, when running on systems that support backslash (\) path separators or case-insensitive file names, allows remote attackers to access arbitrary files via (1) \"..%5c\" (encoded backslash) sequences or (2) filenames that match patterns in the :NondisclosureName option."
          super({
            :name=>"CVE-2008-1145",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2008, 3, 4),
            :cwe=>"22",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www.ruby-lang.org/en/news/2008/06/20/arbitrary-code-execution-vulnerabilities/"]
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.9.0", :patchlevel=>"p2"}, 
            {:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p22"}, 
            {:engine=>"ruby", :version=>"1.8.6", :patchlevel=>"p114"}, 
            {:engine=>"ruby", :version=>"1.8.5", :patchlevel=>"p115"},
            {:engine=>"ruby", :version=>"1.8.4", :patchlevel=>"p999"},
            {:engine=>"ruby", :version=>"1.8.3", :patchlevel=>"p999"},
            {:engine=>"ruby", :version=>"1.8.2", :patchlevel=>"p999"},
            {:engine=>"ruby", :version=>"1.8.1", :patchlevel=>"p999"},
            {:engine=>"ruby", :version=>"1.8.0", :patchlevel=>"p999"},
            {:engine=>"ruby", :version=>"1.6.999", :patchlevel=>"p999"}
          ]

				end
			end
		end
	end
end
