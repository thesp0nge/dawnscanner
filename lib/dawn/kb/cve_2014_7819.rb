module Dawn
		module Kb
			# Automatically created with rake on 2015-08-31
			class CVE_2014_7819
				include DependencyCheck

				def initialize
          message = "Multiple directory traversal vulnerabilities in server.rb in Sprockets before 2.0.5, 2.1.x before 2.1.4, 2.2.x before 2.2.3, 2.3.x before 2.3.3, 2.4.x before 2.4.6, 2.5.x before 2.5.1, 2.6.x and 2.7.x before 2.7.1, 2.8.x before 2.8.3, 2.9.x before 2.9.4, 2.10.x before 2.10.2, 2.11.x before 2.11.3, 2.12.x before 2.12.3, and 3.x before 3.0.0.beta.3, as distributed with Ruby on Rails 3.x and 4.x, allow remote attackers to determine the existence of files outside the application root via a ../ (dot dot slash) sequence with (1) double slashes or (2) URL encoding."

           super({
            :name=>"CVE-2014-7819",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N)",
            :release_date => Date.new(2014, 11, 8),
            :cwe=>"22",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails gem to latest version or at least 3.2.18 or 4.1.8. If you're using sprockets standalone, please upgrade it to the latest version.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=rubyonrails-security/wQBeGXqGs3E/JqUMB6fhh3gJ"]
           })

           self.save_major = true
           self.save_minor = true
           self.safe_dependencies = [{:name=>"rails", :version=>['3.2.18', '4.1.8']},
                                     {:name=>"sprockets", :version=>['2.0.6', '2.1.4', '2.2.3', '2.3.3', '2.4.6', '2.5.1', '2.6.1', '2.7.1', '2.8.3', '2.9.4', '2.10.2', '2.11.3', '2.12.3', '3.0.0.beta3']}]

				end
			end
		end
end
