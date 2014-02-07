module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-07
			class CVE_2013_1607
				include DependencyCheck

				def initialize
          message = "PDFKit Gem for Ruby contains a flaw that is due to the program failing to properly validate input during the handling of parameters when generating PDF files. This may allow a remote attacker to potentially execute arbitrary code via the pdfkit generation options."
          super({
            :name=>"CVE-2013-1607",
            :cvss=>"",
            :release_date => Date.new(2013, 2, 21),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"To mitigate this vulnerability you must upgrade pdfkit gem version to 0.5.3 or higher.",
            :aux_links=>["https://github.com/pdfkit/pdfkit/issues/164"]
          })
          self.safe_dependencies = [{:name=>"pdfkit", :version=>['0.5.3']}]
				end
			end
		end
	end
end
