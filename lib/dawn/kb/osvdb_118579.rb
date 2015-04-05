module Dawn
		module Kb
			# Automatically created with rake on 2015-04-04
			class OSVDB_118579
				# Include the testing skeleton for this Security Check
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          message = "xaviershay-dm-rails Gem for Ruby contains a flaw in the execute() function in /datamapper/dm-rails/blob/master/lib/dm-rails/storage.rb. The issue is due to the function exposing sensitive information via the process table. This may allow a local attack to gain access to MySQL credential information."
          super({
            :name=> "OSVDB_118579",
            :cve=>"2015-2179",
            :osvdb=>"118579",
            :cvss=>"",
            :release_date => Date.new(2015, 2, 17),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"We are not currently aware of a solution for this vulnerability (4 April 2015)",
            :aux_links=>[""]
           })
           self.safe_dependencies = [{:name=>"xaviershay-dm-rails", :version=>['0.8.0']}]

				end
			end
		end
end
