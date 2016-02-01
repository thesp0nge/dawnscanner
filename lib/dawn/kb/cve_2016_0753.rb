module Dawn
		module Kb
			# Automatically created with rake on 2016-02-01
			class CVE_2016_0753
				include DependencyCheck

				def initialize
          message = "There is a possible input validation circumvention vulnerability in Active Model. Code that uses Active Model based models (including Active Record models) and does not validate user input before passing it to the model can be subject to an attack where specially crafted input will cause the model to skip validations."
           super({
            :title=>title,
            :name=> "CVE-2016-0753",
            :cve=>"2016-0753",
            :osvdb=>"",
            :cvss=>"",
            :release_date => Date.new(2016, 1, 26),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade activemodel gem to version 3.2.22.1, 4.1.14.1, 4.2.5.1, 5.0.0.beta1.1 or later.",
            :aux_links=>["http://securitytracker.com/id/1034816"]
           })
          self.save_minor=true
          self.save_major=true
          self.safe_dependencies = [{:name=>"activemodel", :version=>['3.2.22.1', '4.1.14.1', '4.2.5.1', '5.0.0.beta1.1']}]

				end
			end
		end
end
