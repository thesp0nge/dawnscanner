module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2007_5380
				include DependencyCheck

				def initialize
          message = "Session fixation vulnerability in Rails before 1.2.4, as used for Ruby on Rails, allows remote attackers to hijack web sessions via unspecified vectors related to \"URL-based sessions.\""
           super({
            :name=>"CVE-2007-5380",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2007, 10, 19),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 1.2.4 or higher. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2007/10/5/rails-1-2-4-maintenance-release"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['1.2.4']}]

				end
			end
		end
	end
end
