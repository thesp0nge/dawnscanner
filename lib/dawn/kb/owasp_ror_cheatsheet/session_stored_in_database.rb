module Dawn
  module Kb
    module OwaspRorCheatSheet

      class SessionStoredInDatabase
        include PatternMatchCheck

        def initialize
          message = "By default, Ruby on Rails uses a Cookie based session store. What that means is that unless you change something, the session will not expire on the server. That means that some default applications may be vulnerable to replay attacks. It also means that sensitive information should never be put in the session."

          super({
            :name=>"Owasp Ror CheatSheet: Session management",
            :kind=>Dawn::KnowledgeBase::PATTERN_MATCH_CHECK,
            :applies=>["rails"],
            :glob=>"session_store.rb",
            :aux_links=>["https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet"],
            :message=>message,
            :attack_pattern => ["Application.config.session_store :active_record_store", "Rails.application.config.session_store ActionDispatch::Session::CacheStore"],
            :negative_search=>true,
            :avoid_comments=>true,
            :check_family=>:owasp_ror_cheatsheet,
            :severity=>:info,
            :evidences=>["In your session_store.rb file you are not using ActiveRecord to store session data. This will let rails to use a cookie based session and it can expose your web application to a session replay attack."],
            :mitigation=>"Use ActiveRecord or the ORM you love most to handle your code session_store. Add \"Application.config.session_store :active_record_store\" to your session_store.rb file."
          })
          # @debug = true
        end
      end
    end
  end
end
