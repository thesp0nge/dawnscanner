module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-07-09
			class CVE_2010_1330
				include RubyVersionCheck

				def initialize
           message="The regular expression engine in JRuby before 1.4.1, when $KCODE is set to 'u', does not properly handle characters immediately after a UTF-8 character, which allows remote attackers to conduct cross-site scripting (XSS) attacks via a crafted string."
           super({
            :name=>"CVE-2010-1330",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2012, 11, 23),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your jruby interpreter",
            :aux_links=>["http://www.jruby.org/2010/04/26/jruby-1-4-1-xss-vulnerability.html"]
          })

          self.safe_rubies = [{:engine=>"jruby", :version=>"1.4.2", :patchlevel=>"p0"}]


				end
			end
		end
	end
end
