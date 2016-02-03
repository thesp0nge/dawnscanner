module Dawn
		module Kb
			# Automatically created with rake on 2016-01-31
			class CVE_2015_7579
				include DependencyCheck

				def initialize
          message = "There is a XSS vulnerability in Rails::Html::FullSanitizer used by Action View's strip_tags. Due to the way that Rails::Html::FullSanitizer is implemented, if an attacker passes an already escaped HTML entity to the input of Action View's strip_tags these entities will be unescaped what may cause a XSS attack if used in combination with raw or html_safe."
          super({
            :title=>title,
            :name=> "CVE-2015-7579",
            :cve=>"2015-7579",
            :osvdb=>"",
            :cvss=>"",
            :release_date => Date.new(2016, 1, 26),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails-html-sanitizer to version 1.0.3 or later.",
            :aux_links=>["http://securitytracker.com/id/1034816"]
           })
          self.safe_dependencies = [{:name=>"rails-html-sanitizer", :version=>['1.0.3']}]
          self.not_affected = {:name=>"rails-html-sanitizer", :version=>['1.0.0', '1.0.1']}

				end
			end
		end
end
