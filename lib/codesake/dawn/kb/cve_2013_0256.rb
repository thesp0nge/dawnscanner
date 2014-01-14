module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-14
			class CVE_2013_0256_a

        include DependencyCheck

				def initialize
          message = "CVE_2013_0256_b: rdoc gem is vulnerable"

          super({
            :name=>"CVE-2013-0256-b",
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
          })

          self.safe_dependencies = [{:name=>"rdoc", :version=>['2.3.1', '3.13', '4.0.0']}]

        end
      end
			class CVE_2013_0256_b
        include RubyVersionCheck
        def initialize
          message = "CVE_2013_0256_b: ruby 1.9.x before 1.9.3-p383 and 2.0.0 before rc2 have problems"
          super({
            :name=>"CVE-2013-0256-b",
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
          })
          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p383"}, 
            {:engine=>"ruby", :version=>"2.0.0", :patchlevel=>"p0"}
          ]
        end


      end

			class CVE_2013_0256
				include ComboCheck

				def initialize
          message = "darkfish.js in RDoc 2.3.0 through 3.12 and 4.x before 4.0.0.preview2.1, as used in Ruby, does not properly generate documents, which allows remote attackers to conduct cross-site scripting (XSS) attacks via a crafted URL."
          super({
            :name=>"CVE-2013-0256",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2013, 3, 1),
            :cwe=>"79",
            :owasp=>"A3", 
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::COMBO_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rdoc version at least to 2.3.1, 3.13 or 4.0.0. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["http://blog.segment7.net/2013/02/06/rdoc-xss-vulnerability-cve-2013-0256-releases-3-9-5-3-12-1-4-0-0-rc-2"],
            :checks=>[CVE_2013_0256_a.new, CVE_2013_0256_b.new]
          })

				end
			end
		end
	end
end
