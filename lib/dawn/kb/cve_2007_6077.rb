module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2007_6077
				include DependencyCheck

				def initialize
          message = "The session fixation protection mechanism in cgi_process.rb in Rails 1.2.4, as used in Ruby on Rails, removes the :cookie_only attribute from the DEFAULT_SESSION_OPTIONS constant, which effectively causes cookie_only to be applied only to the first instantiation of CgiRequest, which allows remote attackers to conduct session fixation attacks. NOTE: this is due to an incomplete fix for CVE-2007-5380. It has been reviewed in 2012 and it affects also 2.3.x, 3.0.x and 3.1.x."

          super({
            :name=>"CVE-2007-6077",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2007, 11, 21),
            :cwe=>"362",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 1.2.7, 2.1.3, 2.3.13, 3.0.15, 3.1.7, 3.2.7 or higher. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2007/11/24/ruby-on-rails-1-2-6-security-and-maintenance-release"]
          })


          self.safe_dependencies = [{:name=>"rails", :version=>['1.2.7', '2.1.3', '2.3.13', '3.0.15', '3.1.7', '3.2.7', '2.0.999', '1.9.999', '1.2.999', '1.1.999', '0.999.999']}]

				end
			end
		end
	end
end
