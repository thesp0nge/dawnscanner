module Dawn
		module Kb
			# Automatically created with rake on 2015-09-02
			class CVE_2014_7818
				include DependencyCheck

				def initialize
          message = "Directory traversal vulnerability in actionpack/lib/action_dispatch/middleware/static.rb in Action Pack in Ruby on Rails 3.x before 3.2.20, 4.0.x before 4.0.11, 4.1.x before 4.1.7, and 4.2.x before 4.2.0.beta3, when serve_static_assets is enabled, allows remote attackers to determine the existence of files outside the application root via a /..%2F sequence."
           super({
            :name=>"CVE-2014-7818",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2014, 11, 8),
            :cwe=>"22",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails gem to latest version or at least 3.2.20, 4.0.11, 4.1.7 or 4.2.0.beta3. If unsure upgrade to the latest available version.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=rubyonrails-security/dCp7duBiQgo/v_R_8PFs5IwJ"]
           })

           self.safe_dependencies = [{:name=>"rails", :version=>['3.2.20', '4.0.11', '4.1.7', '4.2.0.beta3']}]
          self.save_major = true
				end
			end
		end
end
