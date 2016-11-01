module Dawn
		module Kb
			# Automatically created with rake on 2016-10-02
			class OSVDB_132234
				# Include the testing skeleton for this Security Check
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
					title   = "rack-attack Gem for Ruby missing normalization before request path processing"
					message = "When using rack-attack with a rails app, developers expect the request path to be normalized. In particular, trailing slashes are stripped so a request path \"/login/\" becomes \"/login\" by the time you're in ActionController. Since Rack::Attack runs before ActionDispatch, the request path is not yet normalized. This can cause throttles and blacklists to not work as expected. E.g., a throttle: throttle('logins', ...) {|req| req.path == \"/login\" } would not match a request to '/login/', though Rails would route '/login/' to the same '/login' action."

          super({
            :title=>title,
            :name=> "OSVDB_132234",
            :cve=>"",
            :osvdb=>"132234",
            :cvss=>"",
            :release_date => Date.new(2015, 12, 15),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rack-attack gem to version 4.3.1 or later.",
            :aux_links=>['https://github.com/kickstarter/rack-attack/releases/tag/v4.3.1']
           })
          self.safe_dependencies = [{:name=>"rack-attack", :version=>['4.3.1']}]

				end
			end
		end
end
