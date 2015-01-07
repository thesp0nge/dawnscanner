module Codesake
  module Dawn
    module Kb
      module OwaspRorCheatSheet
        class SecurityRelatedHeaders
          include PatternMatchCheck

          def initialize
            message = "To set a header value, simply access the response.headers object as a hash inside your controller (often in a before/after_filter). Rails 4 provides the \"default_headers\" functionality that will automatically apply the values supplied. This works for most headers in almost all cases."

            super({
              :name=>"Owasp Ror CheatSheet: Security Related Headers",
              :kind=>Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK,
              :applies=>["rails"],
              :glob=>"**/controllers/*.rb",
              :aux_links=>["https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet"],
              :message=>message,
              :attack_pattern => [
                "response.headers\\['X-Frame-Options'\\] = 'DENY'",
                "response.headers\\['X-Content-Type-Options'\\] = 'nosniff'",
                "response.headers\\['X-XSS-Protection'\\] = '1'",
                "ActionDispatch::Response.default_headers = {
                    'X-Frame-Options' => 'DENY',
                    'X-Content-Type-Options' => 'nosniff',
                    'X-XSS-Protection' => '1;'
                  }"],
              :negative_search=>true,
              :check_family=>:owasp_ror_cheatsheet,
              :severity=>:info,
              :mitigation=>"Use response headers like X-Frame-Options, X-Content-Type-Options, X-XSS-Protection in your project."
            })
          end
        end
      end
    end
  end
end

