module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-07
			class CVE_2006_3694
				include RubyVersionCheck

				def initialize
          message = "Multiple unspecified vulnerabilities in Ruby before 1.8.5 allow remote attackers to bypass \"safe level\" checks via unspecified vectors involving (1) the alias function and (2) \"directory operations\"."
         super({
            :name=>"CVE-2006-3694",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:N",
            :release_date => Date.new(2006, 7, 21),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www.securityfocus.com/bid/18944"]
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.8.5", :patchlevel=>"p0"}
          ]
 
				end
			end
		end
	end
end
