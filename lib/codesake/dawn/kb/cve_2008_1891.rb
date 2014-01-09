module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2008_1891
				include RubyVersionCheck

				def initialize
          message = "Directory traversal vulnerability in WEBrick in Ruby 1.8.4 and earlier, 1.8.5 before 1.8.5-p231, 1.8.6 before 1.8.6-p230, 1.8.7 before 1.8.7-p22, and 1.9.0 before 1.9.0-2, when using NTFS or FAT filesystems, allows remote attackers to read arbitrary CGI files via a trailing (1) + (plus), (2) %2b (encoded plus), (3) . (dot), (4) %2e (encoded dot), or (5) %20 (encoded space) character in the URI, possibly related to the WEBrick::HTTPServlet::FileHandler and WEBrick::HTTPServer.new functionality and the :DocumentRoot option."
          
          super({
            :name=>"CVE-2008-1891",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2008, 4, 18),
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
            {:engine=>"ruby", :version=>"1.8.6", :patchlevel=>"p230"}, 
            {:engine=>"ruby", :version=>"1.8.5", :patchlevel=>"p231"},
            {:engine=>"ruby", :version=>"1.8.4", :patchlevel=>"p999"},
            {:engine=>"ruby", :version=>"1.8.3", :patchlevel=>"p999"},
            {:engine=>"ruby", :version=>"1.8.2", :patchlevel=>"p999"},
            {:engine=>"ruby", :version=>"1.8.1", :patchlevel=>"p999"},
            {:engine=>"ruby", :version=>"1.8.0", :patchlevel=>"p999"}
          ]

				end
			end
		end
	end
end
