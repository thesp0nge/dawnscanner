module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-08

			class CVE_2011_0188_a
        include RubyVersionCheck
        
        def initialize

          message =  "CVE_2011_0188_a: ruby 1.9.2-p136 and earlier has problems"

          super({
            :name=>"CVE-2011-0995_a",
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
          })

          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.9.2", :patchlevel=>"p137"}, 
            {:engine=>"ruby", :version=>"1.9.1", :patchlevel=>"p999"}, 
            {:engine=>"ruby", :version=>"1.9.0", :patchlevel=>"p999"} 
          ]
        end
      end

      class CVE_2011_0188_b
        include OperatingSystemCheck
        def initialize

        message =  "CVE_2011_0188_b: Only on Mac OS X 10.6.7 and earlier"

        super({
            :name=>"CVE-2011-0188_b",
            :kind=>Codesake::Dawn::KnowledgeBase::OS_CHECK,
          })

          self.safe_os = [
            {:family=>"osx", :vendor=>"apple", :version=>['10.6.8']},
            {:family=>"osx", :vendor=>"apple", :version=>['10.5.9']}
          ]

        end

      end
			class CVE_2011_0188
        include ComboCheck

				def initialize
          message = "The VpMemAlloc function in bigdecimal.c in the BigDecimal class in Ruby 1.9.2-p136 and earlier, as used on Apple Mac OS X before 10.6.7 and other platforms, does not properly allocate memory, which allows context-dependent attackers to execute arbitrary code or cause a denial of service (application crash) via vectors involving creation of a large BigDecimal value within a 64-bit process, related to an \"integer truncation issue.\""

           super({
            :name=>"CVE-2011-0188",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2011, 3, 23),
            :cwe=>"189",
            :owasp=>"A9", 
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::COMBO_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade your ruby interpreter",
            :aux_links=>["https://bugzilla.redhat.com/show_bug.cgi?id=682332"],
            :checks=>[CVE_2011_0188_a.new, CVE_2011_0188_b.new]
          })

				end
			end
		end
	end
end
