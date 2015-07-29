module Dawn
		module Kb
			# Automatically created with rake on 2015-07-29
			class CVE_2015_2963
				include DependencyCheck

				def initialize
          message = "The thoughtbot paperclip gem before 4.2.2 for Ruby does not consider the content-type value during media-type validation, which allows remote attackers to upload HTML documents and conduct cross-site scripting (XSS) attacks via a spoofed value, as demonstrated by image/jpeg."
          super({
            :name=>"CVE-2015-2963",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2015, 7, 10),
            :cwe=>"79",
            :owasp=>"A1",
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade paperclip gem to latest version.",
            :aux_links=>["https://github.com/thoughtbot/paperclip/commit/9aee4112f36058cd28d5fe4a006d6981bd1eda57","https://robots.thoughtbot.com/paperclip-security-release"]
           })

          self.safe_dependencies = [{:name=>"paperclip", :version=>['4.2.2']}]

				end
			end
		end
end
