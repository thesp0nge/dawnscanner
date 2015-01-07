module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2008_2376
				include RubyVersionCheck

				def initialize
          message = "Integer overflow in the rb_ary_fill function in array.c in Ruby before revision 17756 allows context-dependent attackers to cause a denial of service (crash) or possibly have unspecified other impact via a call to the Array#fill method with a start (aka beg) argument greater than ARY_MAX_SIZE. NOTE: this issue exists because of an incomplete fix for other closely related integer overflows."

          super({
            :name=>"CVE-2008-2376",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2008, 7, 9),
            :cwe=>"189",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www.openwall.com/lists/oss-security/2008/07/02/3"]
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.8.6", :patchlevel=>"p231"}
          ]

				end
			end
		end
	end
end
