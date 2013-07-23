module Codesake
  module Dawn
    module Kb
      module OwaspRorCheatSheet

        class MassAssignmentInModel

           include PatternMatchCheck

          def initialize
            message = "Although the major issue with Mass Assignment has been fixed by default in base Rails specifically when generating new projects, it still applies to older and upgraded projects so it is important to understand the issue and to ensure that only attributes that are intended to be modifiable are exposed."

            super({
              :name=>"Owasp Ror CheatSheet: Mass Assignement in model",
              :kind=>Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK,
              :applies=>["rails"],
              :glob=>"**/model/*.rb",
              :aux_links=>["https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet"],
              :message=>message,
              :attack_pattern => ["attr_accessor"],
              :negative_search=>true
            })
            @debug = true
          end

        end
      end
    end
  end
end
