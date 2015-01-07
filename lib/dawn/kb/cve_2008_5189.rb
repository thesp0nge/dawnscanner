module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2008_5189
				include DependencyCheck

				def initialize
          message = "CRLF injection vulnerability in Ruby on Rails before 2.0.5 allows remote attackers to inject arbitrary HTTP headers and conduct HTTP response splitting attacks via a crafted URL to the redirect_to function."
          super({
            :name=>"CVE-2008-5189",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2008, 11, 21),
            :cwe=>"352",
            :owasp=>"A8", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.0.5 or higher. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2008/10/19/response-splitting-risk"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.0.5', '1.9.999', '1.2.999', '1.1.999', '0.999.999']}]

				end
			end
		end
	end
end
