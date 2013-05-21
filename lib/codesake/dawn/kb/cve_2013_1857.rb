module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-02
			class CVE_2013_1857
				include DependencyCheck

        def initialize
          message = "The sanitize helper in lib/action_controller/vendor/html-scanner/html/sanitizer.rb in the Action Pack component in Ruby on Rails before 2.3.18, 3.0.x and 3.1.x before 3.1.12, and 3.2.x before 3.2.13 does not properly handle encoded : (colon) characters in URLs, which makes it easier for remote attackers to conduct cross-site scripting (XSS) attacks via a crafted scheme name, as demonstrated by including a &#x3a; sequence."

          super({
            :name=>'CVE-2013-1857', 
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N", 
            :release_date => Date.new(2013, 3, 19),
            :cwe=>"79", 
            :owasp=>"A3",
            :applies=>["rails"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade rails version at least to 2.3.18, 3.0.8, 3.1.10 and 3.2.11. As a general rule, using the latest stable rails version is recommended.",
            :aux_links => [ "https://groups.google.com/d/msg/rubyonrails-security/zAAU7vGTPvI/1vZDWXqBuXgJ" ]
          })
          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.18', '3.0.8', '3.2.13', '3.1.12']}]

        end
      end
    end
  end
end
