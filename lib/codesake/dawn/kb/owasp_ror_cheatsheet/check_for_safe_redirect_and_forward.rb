module Codesake
	module Dawn
		module Kb
      module OwaspRorCheatSheet

			class CheckForSafeRedirectAndForward
				include PatternMatchCheck

				def initialize
          message = <<EOT
          Web applications often require the ability to dynamically redirect users based on client-supplied data. To clarify, dynamic redirection usually entails the client including a URL in a parameter within a request to the application. Once received by the application, the user is redirected to the URL specified in the request. For example:
            http://www.example.com/redirect?url=http://www.example_commerce_site.com/checkout
          The above request would redirect the user to http://www.example.com/checkout. The security concern associated with this functionality is leveraging an organization’s trusted brand to phish users and trick them into visiting a malicious site, in our example, “badhacker.com”. Example:
            http://www.example.com/redirect?url=http://badhacker.com
          The most basic, but restrictive protection is to use the :only_path option. Setting this to true will essentially strip out any host information.

EOT

            super({
              :name=>"Owasp Ror CheatSheet: Check for safe redirect and forward",
              :kind=>Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK,
              :applies=>["rails"],
              :glob=>"*.rb",
              :aux_links=>["https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet"],
              :message=>message,
              :attack_pattern => ["redirect_to (\w+\[\w+\])?, :only_path => true"],
              :attack_pattern_is_regex=>true,
              :mitigation=>"Make sure you are using Rails protect_from_forgery facilities in application_controller.rMake sure you are using Rails protect_from_forgery facilities in application_controller.rb"
            })
            # @debug = true

				end
      end
			end
		end
	end
end
