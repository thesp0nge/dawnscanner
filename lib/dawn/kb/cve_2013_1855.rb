module Codesake
  module Dawn
    module Kb
      class CVE_2013_1855 
				include DependencyCheck

        def initialize
          message = "The sanitize_css method in lib/action_controller/vendor/html-scanner/html/sanitizer.rb in the Action Pack component in Ruby on Rails before 2.3.18, 3.0.x and 3.1.x before 3.1.12, and 3.2.x before 3.2.13 does not properly handle \\n (newline) characters, which makes it easier for remote attackers to conduct cross-site scripting (XSS) attacks via crafted Cascading Style Sheets (CSS) token sequences."

          super({
            :name=>'CVE-2013-1855', 
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",  
            :release_date => Date.new(2013, 3, 19),
            :cwe=>"79", 
            :owasp=>"A3",
            :applies=>["rails"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade rails version at least to 2.3.18, 3.0.8, 3.1.12 and 3.2.13. As a general rule, using the latest stable rails version is recommended.",
            :aux_links => ["https://groups.google.com/d/msg/rubyonrails-security/4_QHo4BqnN8/_RrdfKk12I4J"]
          })
          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.18', '3.0.8', '3.2.13', '3.1.12']}]
        end
      end
    end
  end
end
