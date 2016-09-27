	module Dawn
		module Kb
			# Automatically created with rake on 2014-05-06
			class CVE_2014_0130
				include DependencyCheck

				def initialize
          message = "The implicit render functionality allows controllers to render a template, even if there is no explicit action with the corresponding name.  This module does not perform adequate input sanitization which could allow an attacker to use a specially crafted request to retrieve arbitrary files from the rails application server."
          super({
            :name=>"CVE-2014-0130",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2014, 5, 6),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version up to version 3.2.18, 4.0.5 or 4.1.1.",
            :aux_links=>["https://groups.google.com/forum/#!msg/rubyonrails-security/NkKc7vTW70o/NxW_PDBSG3AJ"]
          })
          self.safe_dependencies = [{:name=>"rails", :version=>['3.2.18', '4.0.5', '4.1.1']}]

          self.save_major = true
				end
			end
		end
	end
