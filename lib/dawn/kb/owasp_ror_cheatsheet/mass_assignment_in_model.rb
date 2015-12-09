module Dawn
  module Kb
    module OwaspRorCheatSheet

      class MassAssignmentInModel

        include PatternMatchCheck

        def initialize
          message = "Although the major issue with Mass Assignment has been fixed by default in base Rails specifically when generating new projects, it still applies to older and upgraded projects so it is important to understand the issue and to ensure that only attributes that are intended to be modifiable are exposed."

          super({
            :name=>"Owasp Ror CheatSheet: Mass Assignement in model",
            :kind=>Dawn::KnowledgeBase::PATTERN_MATCH_CHECK,
            :applies=>["rails"],
            :glob=>"**/model/*.rb",
            :aux_links=>["https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet"],
            :message=>message,
            :attack_pattern => ["attr_accessor"],
            :negative_search=>false,
            :avoid_comments=>true,
            :check_family=>:owasp_ror_cheatsheet,
            :severity=>:info,
            :evidences=>["In one or more of your models, you use attr_accessor attribute modifier. This is risky since it exposes you to a massive assignment vulnerability. You have to carefully handle how your model receive data by setting all attribute to attr_reader and using a setter method validating input before saving to database."],
            :mitigation=>"Avoid attr_accessor attribute modifier in your models. You must use attr_reader as modifier and carefully filter your inputs before passing to the database layer."
          })
          # @debug = true
        end

      end
    end
  end
end
