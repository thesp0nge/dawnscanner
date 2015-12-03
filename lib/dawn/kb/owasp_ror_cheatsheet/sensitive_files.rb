module Dawn
  module Kb
    module OwaspRorCheatSheet

      class SensitiveFiles
        include PatternMatchCheck

        def initialize
          message = "Many Ruby on Rails apps are open source and hosted on publicly available source code repositories. Whether that is the case or the code is committed to a corporate source control system, there are certain files that should be either excluded or carefully managed." 

          super({
            :name=>"Owasp Ror CheatSheet: Sensitive Files",
            :kind=>Dawn::KnowledgeBase::PATTERN_MATCH_CHECK,
            :applies=>["rails"],
            :glob=>".gitignore",
            :aux_links=>["https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet"],
            :message=>message,
            :check_family=>:owasp_ror_cheatsheet,
            :severity=>:info,
            :attack_pattern => ["/config/database.yml", "/config/initializers/secret_token.rb", "/db/seeds.rb", "/db/*.sqlite3"],
            :mitigation=>"Put sensitive files in your repository gitignore file"
          })
          # @debug = true

        end
      end
    end
  end
end
