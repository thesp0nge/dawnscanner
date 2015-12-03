module Dawn
  module Kb
    class OwaspRorCheatsheet
      include ComboCheck

      def initialize
        message = "This Cheatsheet intends to provide quick basic Ruby on Rails security tips for developers. It complements, augments or emphasizes points brought up in the rails security guide from rails core.  The Rails framework abstracts developers from quite a bit of tedious work and provides the means to accomplish complex tasks quickly and with ease. New developers, those unfamiliar with the inner-workings of Rails, likely need a basic set of guidelines to secure fundamental aspects of their application. The intended purpose of this doc is to be that guide."

        super({
          :name=>"Owasp Ror Cheatsheet", 
          :applies=>["rails"],
          :kind=>Dawn::KnowledgeBase::COMBO_CHECK,
          :aux_links=>["https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet"],
          :message=>message,
          :mitigation=>"Please refere to the Ruby on Rails cheatsheet available from owasp.org to mitigate this vulnerability",
          :checks=>[
            Dawn::Kb::OwaspRorCheatSheet::CommandInjection.new,
            Dawn::Kb::OwaspRorCheatSheet::Csrf.new,
            Dawn::Kb::OwaspRorCheatSheet::SessionStoredInDatabase.new,
            Dawn::Kb::OwaspRorCheatSheet::MassAssignmentInModel.new, 
            Dawn::Kb::OwaspRorCheatSheet::SecurityRelatedHeaders.new, 


          ],
          :vuln_if_all_fails => false
        })

        # @debug = true

      end
    end
  end
end
