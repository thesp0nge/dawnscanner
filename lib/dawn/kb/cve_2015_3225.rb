module Dawn
		module Kb
			# Automatically created with rake on 2015-07-29
			class CVE_2015_3225
				include DependencyCheck

				def initialize
          message = "lib/rack/utils.rb in Rack before 1.5.4 and 1.6.x before 1.6.2, as used with Ruby on Rails 3.x and 4.x and other products, allows remote attackers to cause a denial of service (SystemStackError) via a request with a large parameter depth."

          super({
            :name=>"CVE-2015-3225",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2015, 7, 26),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rack gem to latest version or at least 1.5.4 or 1.6.2.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=rubyonrails-security/gcUbICUmKMc/qiCotVZwXrMJ"]
           })
          self.save_minor = true
          self.safe_dependencies = [{:name=>"rack", :version=>['1.5.4', '1.6.2']}]

				end
			end
		end
end
