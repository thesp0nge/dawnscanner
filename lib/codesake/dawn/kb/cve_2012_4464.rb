module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-30
			class CVE_2012_4464
				include RubyVersionCheck

				def initialize
          message = "Ruby 1.9.3 before patchlevel 286 and 2.0 before revision r37068 allows context-dependent attackers to bypass safe-level restrictions and modify untainted strings via the (1) exc_to_s or (2) name_err_to_s API function, which marks the string as tainted, a different vulnerability than CVE-2012-4466. NOTE: this issue might exist because of a CVE-2011-1005 regression."
          super({
            :name=>"CVE-2012-4464",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2013, 4, 25),
            :cwe=>"264",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby interpreter to 1.9.3-p286 or 2.0.0-p195 or latest version available",
            :aux_links=>["http://www.ruby-lang.org/en/news/2012/10/12/cve-2012-4464-cve-2012-4466/"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p286"}, {:engine=>"ruby", :version=>"2.0.0", :patchlevel=>"p195"}]

				end
			end
		end
	end
end
