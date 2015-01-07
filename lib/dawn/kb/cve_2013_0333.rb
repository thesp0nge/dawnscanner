module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-04-30
			class CVE_2013_0333
				include DependencyCheck


				def initialize
          message = "lib/active_support/json/backends/yaml.rb in Ruby on Rails 2.3.x before 2.3.16 and 3.0.x before 3.0.20 does not properly convert JSON data to YAML data for processing by a YAML parser, which allows remote attackers to execute arbitrary code, conduct SQL injection attacks, or bypass authentication via crafted data that triggers unsafe decoding, a different vulnerability than CVE-2013-0156." 
          super({
            :name=>"CVE-2013-0333",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2013, 1, 30),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 2.3.16 or 3.0.20. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/forum/?fromgroups=#!topic/rubyonrails-security/1h2DR63ViGo"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['2.3.16', '3.0.20']}]
          self.aux_mitigation_gem = {:name=>"yajl", :versione=>['any']}
				end
			end
		end
	end
end
