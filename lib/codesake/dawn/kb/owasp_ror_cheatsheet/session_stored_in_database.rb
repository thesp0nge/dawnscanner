module Codesake
  module Dawn
    module Kb
      module OwaspRorCheatSheet

        class SessionStoredInDatabase
          include PatternMatchCheck

          def initialize
            message = "By default, Ruby on Rails uses a Cookie based session store. What that means is that unless you change something, the session will not expire on the server. That means that some default applications may be vulnerable to replay attacks. It also means that sensitive information should never be put in the session."

            super({
              :name=>"Owasp Ror CheatSheet: Session management",
              :kind=>Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK,
              :applies=>["rails"],
              :glob=>"session_store.rb",
              :aux_links=>["https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet"],
              :message=>message,
              :attack_pattern => ["Application.config.session_store :active_record_store"],
              :negative_search=>true
            })
            # @debug = true
          end 
        end
      end
    end
  end
end
