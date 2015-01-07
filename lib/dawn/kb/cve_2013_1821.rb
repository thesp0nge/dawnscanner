module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-22
			class CVE_2013_1821
				include RubyVersionCheck

				def initialize
          message="lib/rexml/text.rb in the REXML parser in Ruby before 1.9.3-p392 and 2.0.0-p0 allows remote attackers to cause a denial of service (memory consumption and crash) via crafted text nodes in an XML document, aka an XML Entity Expansion (XEE) attack."
          super({
            :name=>"CVE-2013-1821",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2013, 4, 9),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby interpreter to 1.9.3-p392 or 2.0.0-p195 or latest version available",
            :aux_links=>["http://www.ruby-lang.org/en/news/2013/02/22/rexml-dos-2013-02-22/"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p392"}, {:engine=>"ruby", :version=>"2.0.0", :patchlevel=>"p195"}]


				end
			end
		end
	end
end
