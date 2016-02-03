module Dawn
		module Kb
			# Automatically created with rake on 2016-02-02
			class CVE_2015_7541
				# Include the testing skeleton for this CVE
				include DependencyCheck

				def initialize
          message = "The initialize method in the Histogram class in lib/colorscore/histogram.rb in the colorscore gem before 0.0.5 for Ruby allows context-dependent attackers to execute arbitrary code via shell metacharacters in the (1) image_path, (2) colors, or (3) depth variable."
           super({
            :title=>title,
            :name=> "CVE-2015-7541",
            :cve=>"2015-7541",
            :osvdb=>"",
            :cvss=>"AV:N/AC:L/Au:N/C:C/I:C/A:C",
            :release_date => Date.new(2016, 1, 8),
            :cwe=>"77",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade colorscore gem to version 0.0.5 or later.",
            :aux_links=>["http://seclists.org/oss-sec/2016/q1/17"]
           })

           self.safe_dependencies = [{:name=>"colorscore", :version=>['0.0.5']}]

				end
			end
		end
end
