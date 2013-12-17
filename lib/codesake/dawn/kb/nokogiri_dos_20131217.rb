module Codesake
	module Dawn
		module Kb

			class NokogiriDos20131217_a
        include DependencyCheck

        def initialize
          message = "Vulnerability arises when Nokogiri version 1.6.0 and 1.5.x (x<11) is used"
          super({
            :name=>"NokogiriDos20131217_a",
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
          })
          self.safe_dependencies = [{:name=>"nokogiri", :version=>['1.6.1', '1.5.11']}]
        end

      end

			class NokogiriDos20131217_b
         include RubyVersionCheck

         def initialize
          message = "Vulnerability arises when Nokogiri version 1.6.0 and 1.5.x (x<11) is used with JRuby"
          super({
            :name=>"NokogiriDos20131217_b",
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
          })

          self.safe_rubies = [ {:engine=>"jruby", :version=>"99.99.99", :patchlevel=>"p999"}]
        end



      end

			class NokogiriDos20131217
        include ComboCheck

				def initialize
          message = "There is a vulnerability in Nokogiri when using JRuby where the parser can enter an infinite loop and exhaust the process memory. Nokogiri users on JRuby using the native Java extension.  Attackers can send XML documents with carefully crafted documents which can cause the XML processor to enter an infinite loop, causing the server to run out of memory and crash."

          super({
            :name=>"Nokogiri - Denial of service - 20131217",
            :cvss=>"",
            :release_date => Date.new(2013, 12, 15),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::COMBO_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade nokogiri gem to a newer version",
            :aux_links=>["https://groups.google.com/forum/#!topic/ruby-security-ann/DeJpjTAg1FA"],
            :checks=>[NokogiriDos20131217_a.new, NokogiriDos20131217_b.new]
          })


          
				end
			end
		end
	end
end
