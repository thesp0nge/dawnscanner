module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-08
			class CVE_2011_3187
				include DependencyCheck

				def initialize
          message = "The to_s method in actionpack/lib/action_dispatch/middleware/remote_ip.rb in Ruby on Rails 3.0.5 does not validate the X-Forwarded-For header in requests from IP addresses on a Class C network, which might allow remote attackers to inject arbitrary text into log files or bypass intended address parsing via a crafted header."

          super({
            :name=>"CVE-2011-3187",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2011, 8, 29),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails to version 3.0.6. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["http://archives.neohapsis.com/archives/fulldisclosure/2011-02/0337.html"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.0.6']}]
          self.save_major = true

				end
			end
		end
	end
end
