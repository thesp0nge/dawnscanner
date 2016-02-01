module Dawn
		module Kb
			# Automatically created with rake on 2016-02-01
			class CVE_2015_7578
				# Include the testing skeleton for this CVE
				include DependencyCheck

				def initialize
          message = "There is a possible XSS vulnerability in rails-html-sanitizer. Certain attributes are not removed from tags when they are sanitized, and these attributes can lead to an XSS attack on target applications."
           super({
            :title=>title,
            :name=> "CVE-2015-7578",
            :cve=>"2015-7578",
            :osvdb=>"",
            :cvss=>"",
            :release_date => Date.new(2016, 1, 26),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails-html-sanitizer gem to version 1.0.3 or later.",
            :aux_links=>["http://securitytracker.com/id/1034816"]
           })
           self.safe_dependencies = [{:name=>"rails-html-sanitizer", :version=>['1.0.3']}]

				end
			end
		end
end
