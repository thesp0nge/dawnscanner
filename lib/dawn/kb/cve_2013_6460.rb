module Codesake
	module Dawn
		module Kb

      class CVE_2013_6460_a
        include DependencyCheck

        def initialize
          message = "Vulnerability arises when Nokogiri version 1.6.0 and 1.5.x (x<11) is used"
          super({
            :name=>"CVE_2013_6460_a",
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
          })
          self.safe_dependencies = [{:name=>"nokogiri", :version=>['1.6.1', '1.5.11']}]
        end

      end

      class CVE_2013_6460_b
        include RubyVersionCheck
        def initialize
          message = "Vulnerability arises when Nokogiri version 1.6.0 and 1.5.x (x<11) is used with JRuby"
          super({
            :name=>"CVE_2013_6460_b",
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
          })
          self.safe_rubies = [ {:engine=>"jruby", :version=>"99.99.99", :patchlevel=>"p999"}]
          # self.debug = true
        end
      end

			class CVE_2013_6460
        include ComboCheck

				def initialize
          message = "There is a vulnerability in Nokogiri when using JRuby where the parser can enter an infinite loop and exhaust the process memory. Nokogiri users on JRuby using the native Java extension.  Attackers can send XML documents with carefully crafted documents which can cause the XML processor to enter an infinite loop, causing the server to run out of memory and crash."

          super({
            :name=>"CVE-2013-6460",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2013, 12, 15),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::COMBO_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade nokogiri gem to a newer version",
            :aux_links=>["https://groups.google.com/forum/#!topic/ruby-security-ann/DeJpjTAg1FA", "https://access.redhat.com/security/cve/CVE-2013-6460"],
            :checks=>[CVE_2013_6460_a.new, CVE_2013_6460_b.new]
          })
				end
			end
		end
	end
end
