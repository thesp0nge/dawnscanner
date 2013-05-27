module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-27
			class CVE_2013_1933
				include DependencyCheck

				def initialize
          message = "The extract_from_ocr function in lib/docsplit/text_extractor.rb in the Karteek Docsplit (karteek-docsplit) gem 0.5.4 for Ruby allows context-dependent attackers to execute arbitrary commands via shell metacharacters in a PDF filename."
          super({
            :name=>"CVE-2013-1933",
            :cvss=>"AV:N/AC:M/Au:N/C:C/I:C/A:C",
            :release_date => Date.new(2013, 4, 25),
            :cwe=>"78",
            :owasp=>"A9", 
            :applies=>["rails", "padrino", "sinatra"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade karteek-docsplit version to the latest version available.",
            :aux_links=>["http://www.openwall.com/lists/oss-security/2013/04/08/15"]
          })

          self.safe_dependencies = [{:name=>"karteek-docsplit", :version=>['0.5.5']}]

				end
			end
		end
	end
end
