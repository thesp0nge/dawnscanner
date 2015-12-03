module Dawn
		module Kb
			# Automatically created with rake on 2015-12-03
			class CVE_2015_1819
				# Include the testing skeleton for this CVE
				# include PatternMatchCheck
				include DependencyCheck
				# include RubyVersionCheck

				def initialize
          title="Nokogiri denial of service (DoS) Memory Consumption"
          message="Nokogiri versions before 1.6.6.4 contain a vulnerable version of libxml2 as a C extension. The vulnerability allows for memory consumption denial of service."
          super({
            :title=>title,
            :name=> "CVE-2015-1819",
            :cve=>"2015-1819",
            :osvdb=>"",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2015, 8, 14),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade nokogiri gem to version 1.6.6.4 or later.",
            :aux_links=>[""]
           })
          self.safe_dependencies = [{:name=>"nokogiri", :version=>['1.6.6.4']}]


				end
			end
		end
end
