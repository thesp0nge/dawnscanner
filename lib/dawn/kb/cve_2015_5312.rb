module Dawn
		module Kb
			# Automatically created with rake on 2016-02-01
			class CVE_2015_5312
				include DependencyCheck

				def initialize
          message = "The xmlStringLenDecodeEntities function in parser.c in libxml2 before 2.9.3 does not properly prevent entity expansion, which allows context-dependent attackers to cause a denial of service (CPU consumption) via crafted XML data, a different vulnerability than CVE-2014-3660."
           super({
            :title=>title,
            :name=> "CVE-2015-5312",
            :cve=>"2015-5312",
            :osvdb=>"",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:N/A:C",
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
