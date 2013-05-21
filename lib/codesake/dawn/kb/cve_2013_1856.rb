module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-16
			class CVE_2013_1856
				include DependencyCheck

				def initialize
          message= "The ActiveSupport::XmlMini_JDOM backend in lib/active_support/xml_mini/jdom.rb in the Active Support component in Ruby on Rails 3.0.x and 3.1.x before 3.1.12 and 3.2.x before 3.2.13, when JRuby is used, does not properly restrict the capabilities of the XML parser, which allows remote attackers to read arbitrary files or cause a denial of service (resource consumption) via vectors involving (1) an external DTD or (2) an external entity declaration in conjunction with an entity reference."
         super({
            :name=>'CVE-2013-1856', 
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:N/A:P",  
            :release_date => Date.new(2013, 3, 19),
            :cwe=>"20", 
            :owasp=>"A9",
            :applies=>["rails"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade rails version at least to 3.1.12 and 3.2.13. As a general rule, using the latest stable rails version is recommended.",
            :aux_links => ["https://groups.google.com/group/rubyonrails-security/msg/6c2482d4ed1545e6?dmode=source&output=gplain"]
          })
          self.safe_dependencies = [{:name=>"rails", :version=>['3.2.13', '3.1.12']}]
 
				end
			end
		end
	end
end
