module Dawn
		module Kb
			# Automatically created with rake on 2016-02-02
			class CVE_2015_8242
				# Include the testing skeleton for this CVE
				include DependencyCheck

				def initialize
          message = "The xmlSAX2TextNode function in SAX2.c in the push interface in the HTML parser in libxml2 before 2.9.3 allows context-dependent attackers to cause a denial of service (stack-based buffer over-read and application crash) or obtain sensitive information via crafted XML data."
          super({
            :title=>title,
            :name=> "CVE-2015-8242",
            :cve=>"2015-8242",
            :osvdb=>"",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:N/A:P",
            :release_date => Date.new(2015, 12, 15),
            :cwe=>"119",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade nokogiri gem to version 1.6.7.1 or later.",
            :aux_links=>["https://groups.google.com/forum/#!topic/ruby-security-ann/aSbgDiwb24s"]
           })

           self.safe_dependencies = [{:name=>"nokogiri", :version=>['1.6.7.1']}]
           self.not_affected = {:name=>"nokogiri", :version=>['1.5.x', '1.4.x', '1.3.x', '1.1.x', '1.0.x', '0.x.x']}

				end
			end
		end
end
