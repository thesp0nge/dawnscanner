module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-11-26
			class CVE_2013_4164
				include RubyVersionCheck

        def initialize
          message = "Any time a string is converted to a floating point value, a specially crafted string can cause a heap overflow. This can lead to a denial of service attack via segmentation faults and possibly arbitrary code execution. Any program that converts input of unknown origin to floating point values (especially common when accepting JSON) are vulnerable."

          super({
            :name=>"CVE-2013-4164",
            :cvss=>"not assigned",
            :release_date => Date.new(2013, 11, 23),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"All users are recommended to upgrade to Ruby 1.9.3 patchlevel 484, ruby 2.0.0 patchlevel 353 or ruby 2.1.0 preview2.",
            :aux_links=>["https://www.ruby-lang.org/en/news/2013/11/22/heap-overflow-in-floating-point-parsing-cve-2013-4164/"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p484"}, {:engine=>"ruby", :version=>"2.0.0", :patchlevel=>"p353"}, 
            {:engine=>"ruby", :version=>"2.1.0", :patchlevel=>"preview2"}]

				end

			end
		end
	end
end
