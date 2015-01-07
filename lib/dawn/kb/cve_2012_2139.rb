module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-14
			class CVE_2012_2139
				include DependencyCheck

				def initialize
          message = "Directory traversal vulnerability in lib/mail/network/delivery_methods/file_delivery.rb in the Mail gem before 2.4.4 for Ruby allows remote attackers to read arbitrary files via a .. (dot dot) in the to parameter."
          super({
            :name=>'CVE-2012-2139', 
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",  
            :release_date => Date.new(2012, 7, 17),
            :cwe=>"22", 
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade mail_gem version up to 2.4.4. As a general rule, using the latest stable rails version is recommended.",
            :aux_links => ["https://github.com/mikel/mail/commit/29aca25218e4c82991400eb9b0c933626aefc98f"]
          })
          self.safe_dependencies = [{:name=>"mail_gem", :version=>['2.4.4', '2.3.999']}]

				end
			end
		end
	end
end
