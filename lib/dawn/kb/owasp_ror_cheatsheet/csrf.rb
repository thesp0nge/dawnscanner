module Dawn
  module Kb
    module OwaspRorCheatSheet
      class Csrf
        include PatternMatchCheck

        def initialize
          message = "Ruby on Rails has specific, built in support for CSRF tokens. To enable it, or ensure that it is enabled, find the base ApplicationController and look for the protect_from_forgery directive. Note that by default Rails does not provide CSRF protection for any HTTP GET request."

          super({
            :name=>"Owasp Ror CheatSheet: Cross Site Request Forgery",
            :kind=>Dawn::KnowledgeBase::PATTERN_MATCH_CHECK,
            :applies=>["rails"],
            :glob=>"application_controller.rb",
            :aux_links=>["https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet"],
            :message=>message,
            :attack_pattern => ["protect_from_forgery"],
            :negative_search=>true,
            :mitigation=>"Make sure you are using Rails protect_from_forgery facilities in application_controller.rMake sure you are using Rails protect_from_forgery facilities in application_controller.rb",
            :severity=>:info,
            :check_family=>:owasp_ror_cheatsheet
          })
          # @debug = true
        end

      end
    end
  end
end
