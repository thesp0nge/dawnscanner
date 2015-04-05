module Dawn
		module Kb
			# Automatically created with rake on 2015-04-05
			class OSVDB_118830
				# Include the testing skeleton for this Security Check
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          message = "Doorkeeper Gem for Ruby contains a flaw in lib/doorkeeper/engine.rb. The issue is due to the program storing sensitive information in production logs. This may allow a local attacker to gain access to sensitive information."
          super({
            :name=> "OSVDB_118830",
            :cve=>"",
            :osvdb=>"118830",
            :cvss=>"",
            :release_date => Date.new(2015, 2, 10),
            :cwe=>"",
            :owasp=>"A6",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade doorkeeper gem version at least to 2.1.2. As a general rule, using the latest stable version is recommended.",
            :aux_links=>[""]
           })
           self.safe_dependencies = [{:name=>"doorkeeper", :version=>['2.1.2']}]


				end
			end
		end
end
