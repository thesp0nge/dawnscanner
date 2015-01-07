module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-02-06
			class CVE_2012_6109
				include DependencyCheck

				def initialize
          message = "lib/rack/multipart.rb in Rack before 1.1.4, 1.2.x before 1.2.6, 1.3.x before 1.3.7, and 1.4.x before 1.4.2 uses an incorrect regular expression, which allows remote attackers to cause a denial of service (infinite loop) via a crafted Content-Disposion header."
          super({
            :name=>"CVE-2012-6109",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2013, 3, 1),
            :cwe=>"",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rack version up to version 1.4.4, 1.3.9, 1.2.7, 1.1.5 or higher.",
            :aux_links=>["https://groups.google.com/forum/#%21msg/rack-devel/1w4_fWEgTdI/XAkSNHjtdTsJ"]
          })
          self.safe_dependencies = [{:name=>"rack", :version=>['1.4.2', '1.3.7', '1.2.6', '1.1.4', '1.0.9999', '0.9.9999', '0.4.9999', '0.3.9999', '0.2.9999', '0.1.9999']}]
				end
			end
		end
	end
end
