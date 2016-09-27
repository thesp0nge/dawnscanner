	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-21
			class CVE_2014_0081
				include DependencyCheck

				def initialize
          message = "Multiple cross-site scripting (XSS) vulnerabilities in actionview/lib/action_view/helpers/number_helper.rb in Ruby on Rails before 3.2.17, 4.0.x before 4.0.3, and 4.1.x before 4.1.0.beta2 allow remote attackers to inject arbitrary web script or HTML via the (1) format, (2) negative_format, or (3) units parameter to the (a) number_to_currency, (b) number_to_percentage, or (c) number_to_human helper."
           super({
            :name=>"CVE-2014-0081",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2014, 2, 20),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 3.2.17, 4.0.3 or 4.1.0.beta2. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=rubyonrails-security/tfp6gZCtzr4/j8LUHmu7fIEJ"]
           })

           self.safe_dependencies = [{:name=>"rails", :version=>['3.2.17', '4.0.3', '4.1.0.beta2', '3.1.99999', '3.0.99999']}]
          self.save_major = true
				end
			end
		end
	end
