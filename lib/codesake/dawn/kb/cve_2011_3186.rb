module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-29
			class CVE_2011_3186
				include DependencyCheck

				def initialize
          message="CRLF injection vulnerability in actionpack/lib/action_controller/response.rb in Ruby on Rails 2.3.x before 2.3.13 allows remote attackers to inject arbitrary HTTP headers and conduct HTTP response splitting attacks via the Content-Type header."

          super({
            :name=>"CVE-2011-3186",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2011, 8, 29),
            :cwe=>"94",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.13. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://github.com/rails/rails/commit/11dafeaa7533be26441a63618be93a03869c83a9"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.13']}]
 

				end
			end
		end
	end
end
