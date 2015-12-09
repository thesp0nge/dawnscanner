module Dawn
		module Kb
			# Automatically created with rake on 2015-04-04
			class OSVDB_118954
				# Include the testing skeleton for this Security Check
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          message = "Ruby on Rails contains a flaw that is triggered when handling a to_json call to ActiveModel::Name, which can cause an infinite loop. This may allow a remote attacker to cause a denial of service."
          super({
            :name=> "OSVDB_118954",
            :cve=>"",
            :osvdb=>"118954",
            :cvss=>"",
            :release_date => Date.new(2015, 2, 28),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade to latest rails ruby gems",
            :aux_links=>["https://github.com/rails/rails/pull/19055", "https://github.com/rails/rails/issues/19050"]
           })
          self.save_minor=true
          self.save_major=true
          self.safe_dependencies = [{:name=>"rails", :version=>['4.2.1.rc3']}]

				end
			end
		end
end
