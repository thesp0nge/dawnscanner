module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2010_2489_a
        include RubyVersionCheck
        
        def initialize
          message =  "CVE_2010_2489_a: ruby 1.9.2-p429  has problems"
          super({
            :name=>"CVE_2010_2489_a",
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
          })
          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.9.2", :patchlevel=>"p430"},
            {:engine=>"ruby", :version=>"1.9.1", :patchlevel=>"p999"}, 
            {:engine=>"ruby", :version=>"1.9.0", :patchlevel=>"p999"} 
          ]
        end
      end

      class CVE_2010_2489_b
        include OperatingSystemCheck
        def initialize
          message =  "CVE_2010_2489_a: Only on Windows"
          super({
            :name=>"CVE_2010_2489_ab",
            :kind=>Codesake::Dawn::KnowledgeBase::OS_CHECK,
          })

          self.safe_os = [
            {:family=>"windows", :vendor=>"microsoft", :version=>['none']}
          ]

        end

      end

			class CVE_2010_2489
				include ComboCheck

				def initialize
          message = "Buffer overflow in Ruby 1.9.x before 1.9.1-p429 on Windows might allow local users to gain privileges via a crafted ARGF.inplace_mode value that is not properly handled when constructing the filenames of the backup files"
          super({
            :name=>"CVE-2010-2489",
            :cvss=>"AV:L/AC:L/Au:N/C:C/I:C/A:C",
            :release_date => Date.new(2010, 7, 10),
            :cwe=>"119",
            :owasp=>"A9", 
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::COMBO_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade your ruby interpreter",
            :aux_links=>["http://www.ruby-lang.org/en/news/2010/07/02/ruby-1-9-1-p429-is-released/"],
            :checks=>[CVE_2010_2489_a.new, CVE_2010_2489_b.new]
          })

				end
			end
		end
	end
end
