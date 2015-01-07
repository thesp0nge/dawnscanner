module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-20
			class CVE_2013_1656
				include DependencyCheck

				def initialize
          message = "Spree Commerce 1.0.x through 1.3.2 allow remote authenticated administrators to instantiate arbitrary Ruby objects and execute arbitrary commands via the (1) payment_method parameter to core/app/controllers/spree/admin/payment_methods_controller.rb; and the (2) promotion_action parameter to promotion_actions_controller.rb, (3) promotion_rule parameter to promotion_rules_controller.rb, and (4) calculator_type parameter to promotions_controller.rb in promo/app/controllers/spree/admin/, related to unsafe use of the constantize function."


          super({
            :name=>'CVE-2013-1656', 
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",  
            :release_date => Date.new(2013, 3, 8),
            :cwe=>"20", 
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade Spree commerce rubygem",
            :aux_links => ["http://spreecommerce.com/blog/multiple-security-vulnerabilities-fixed"]
          })
          self.safe_dependencies = [{:name=>"spree", :version=>['1.3.3']}]

				end
			end
		end
	end
end
