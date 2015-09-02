module Dawn
		module Kb
			# Automatically created with rake on 2015-08-03
			class CVE_2014_4975
				include RubyVersionCheck

				def initialize
          message = "Off-by-one error in the encodes function in pack.c in Ruby 1.9.3 and earlier, and 2.x through 2.1.2, when using certain format string specifiers, allows context-dependent attackers to cause a denial of service (segmentation fault) via vectors that trigger a stack-based buffer overflow."
          super({
            :name=>"CVE-2014-4975",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2014, 11, 15),
            :cwe=>"119",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby interpreter to 2.1.3 or later. Please note that latest 2.2.x version is suggested.",
            :aux_links=>["http://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=revision&revision=46778", "https://bugs.ruby-lang.org/issues/10019"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.9.99", :patchlevel=>"p999"},
                              {:engine=>"ruby", :version=>"2.0.99", :patchlevel=>"p999"},
                              {:engine=>"ruby", :version=>"2.1.2", :patchlevel=>"p999"}]
        end
      end
    end
end
