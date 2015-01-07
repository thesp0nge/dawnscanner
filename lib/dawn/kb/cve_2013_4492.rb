module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-12-11
			class CVE_2013_4492
				include DependencyCheck

				def initialize
          message = "Cross-site scripting (XSS) vulnerability in exceptions.rb in the i18n gem before 0.6.6 for Ruby allows remote attackers to inject arbitrary web script or HTML via a crafted I18n::MissingTranslationData.new call."

          super({
            :name=>"CVE-2013-4492",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2013, 12, 7),
            :cwe=>"79",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby-i18n to version 0.6.6. As a general rule, using the latest stable version is recommended.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=ruby-security-ann/pLrh6DUw998/bLFEyIO4k_EJ"]
          })

          self.safe_dependencies = [{:name=>"ruby-i18n", :version=>['0.6.6']}]


				end
			end
		end
	end
end
