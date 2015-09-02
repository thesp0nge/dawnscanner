module Dawn
		module Kb
			# Automatically created with rake on 2015-08-03
			class CVE_2014_3916
				include RubyVersionCheck

				def initialize
          message = "The str_buf_cat function in string.c in Ruby 1.9.3, 2.0.0, and 2.1 allows context-dependent attackers to cause a denial of service (segmentation fault and crash) via a long string."
          super({
          :name=>"CVE-2014-3916",
          :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
          :release_date => Date.new(2014, 11, 16),
          :cwe=>"19",
          :owasp=>"A9",
          :applies=>["rails", "sinatra", "padrino"],
          :kind=>Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
          :message=>message,
          :mitigation=>"Please upgrade ruby interpreter to 2.2.x or later.",
          :aux_links=>["https://bugs.ruby-lang.org/issues/9709", "http://www.securityfocus.com/bid/67705"]
        })

        self.safe_rubies = [{:engine=>"ruby", :version=>"1.9.99", :patchlevel=>"p999"},
                            {:engine=>"ruby", :version=>"2.0.99", :patchlevel=>"p999"},
                            {:engine=>"ruby", :version=>"2.1.99", :patchlevel=>"p999"}]

				end
			end
		end
end
