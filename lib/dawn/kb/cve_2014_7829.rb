module Dawn
		module Kb
			# Automatically created with rake on 2015-07-31
			class CVE_2014_7829
				include DependencyCheck

				def initialize
          message = "Directory traversal vulnerability in actionpack/lib/action_dispatch/middleware/static.rb in Action Pack in Ruby on Rails 3.x before 3.2.21, 4.0.x before 4.0.12, 4.1.x before 4.1.8, and 4.2.x before 4.2.0.beta4, when serve_static_assets is enabled, allows remote attackers to determine the existence of files outside the application root via vectors involving a \ (backslash) character, a similar issue to CVE-2014-7818."

          super({
            :name=>"CVE-2014-7829",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2014, 11, 18),
            :cwe=>"22",
            :owasp=>"A9",
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails gem to latest version or at least 3.2.21, 4.0.12, 4.1.8 or 4.2.0.beta4.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=rubyonrails-security/rMTQy4oRCGk/loS_CRS8mNEJ"]
           })

          self.safe_dependencies = [{:name=>"rails", :version=>['3.2.21', '4.0.12', '4.1.8', '4.2.0.beta4']}]
          self.save_major = true
          self.save_minor = false

				end
			end
		end
end
