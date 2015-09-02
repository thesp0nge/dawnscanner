module Dawn
		module Kb
			# Automatically created with rake on 2015-07-31
			class CVE_2012_6684
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in the RedCloth library 4.2.9 for Ruby and earlier allows remote attackers to inject arbitrary web script or HTML via a javascript: URI."
           super({
            :name=>"CVE-2012-6684",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2015, 1, 7),
            :cwe=>"79",
            :owasp=>"A1",
            :osvdb=>"",
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade RedCloth gem to the latest version",
            :aux_links=>["https://gist.github.com/co3k/75b3cb416c342aa1414c", "http://co3k.org/blog/redcloth-unfixed-xss-en"]
           })

           self.safe_dependencies = [{:name=>"RedCloth", :version=>['4.2.10']}]

				end
			end
		end
end
