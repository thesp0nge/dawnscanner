module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2009_4124
				include RubyVersionCheck

				def initialize
          message = "Heap-based buffer overflow in the rb_str_justify function in string.c in Ruby 1.9.1 before 1.9.1-p376 allows context-dependent attackers to execute arbitrary code via unspecified vectors involving (1) String#ljust, (2) String#center, or (3) String#rjust. NOTE: some of these details are obtained from third party information."
          super({
            :name=>"CVE-2009-4124",
            :cvss=>"AV:N/AC:L/Au:N/C:C/I:C/A:C",
            :release_date => Date.new(2009, 12, 11),
            :cwe=>"119",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby interpreter",
            :aux_links=>["http://www.ruby-lang.org/en/news/2009/12/07/heap-overflow-in-string/"]
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.9.1", :patchlevel=>"p376"}, 
          ]


				end
			end
		end
	end
end
