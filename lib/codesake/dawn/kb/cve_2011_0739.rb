module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-08
			class CVE_2011_0739
				include DependencyCheck

				def initialize
          message = "The deliver function in the sendmail delivery agent (lib/mail/network/delivery_methods/sendmail.rb) in Ruby Mail gem 2.2.14 and earlier allows remote attackers to execute arbitrary commands via shell metacharacters in an e-mail address."
          super({
            :name=>"CVE-2011-0739",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2011, 2, 2),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade mail to version 2.2.15. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["http://groups.google.com/group/mail-ruby/browse_thread/thread/e93bbd05706478dd?pli=1"]
          })

          self.safe_dependencies = [
            {:name=>"mail", :version=>['1.99.99', '2.2.15']}
          ]
				end
			end
		end
	end
end
