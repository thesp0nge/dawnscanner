module Dawn
		module Kb
			# Automatically created with rake on 2015-12-02
			class OSVDB_115654
				# Include the testing skeleton for this Security Check
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          title = "Sentry raven-ruby lib/raven/okjson.rb Exponent / Scientific Notation Value Handling Resource Consumption DoS"
          message = "Sentry raven-ruby contains a flaw in the lib/raven/okjson.rb script that is triggered when large numeric values are stored as an exponent or in scientific notation. With a specially crafted request, an attacker can cause the software to consume excessive resources resulting in a denial of service."
          super({
            :title=>title,
            :name=> "OSVDB_115654",
            :cve=>"CVE-2014-9490",
            :osvdb=>"115654",
            :cvss=>"",
            :release_date => Date.new(2015, 1, 20),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade raven-ruby gem to version 0.12.2 or later.",
            :aux_links=>[""]
           })
          self.safe_dependencies = [{:name=>"raven-ruby", :version=>['0.12.2']}]

				end
			end
		end
end
