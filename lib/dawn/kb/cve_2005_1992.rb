module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-06
			class CVE_2005_1992
				include RubyVersionCheck

				def initialize
          message = "The XMLRPC server in utils.rb for the ruby library (libruby) 1.8 sets an invalid default value that prevents \"security protection\" using handlers, which allows remote attackers to execute arbitrary commands."

          super({
            :name=>"CVE-2005-1992",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2005, 06, 20),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www2.ruby-lang.org/en/20050701.html"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.8.999", :patchlevel=>"p0"}]

				end
			end
		end
	end
end
