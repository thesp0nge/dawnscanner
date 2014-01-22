module Codesake
  module Dawn 
    module Kb
      module OwaspRorCheatSheet
        class CommandInjection
          include PatternMatchCheck

          def initialize
            message = "Ruby offers a function called \"eval\" which will dynamically build new Ruby code based on Strings. It also has a number of ways to call system commands. While the power of these commands is quite useful, extreme care should be taken when using them in a Rails based application. Usually, its just a bad idea. If need be, a whitelist of possible values should be used and any input should be validated as thoroughly as possible. The Ruby Security Reviewer's Guide has a section on injection and there are a number of OWASP references for it, starting at the top: Command Injection."

            super({
              :name=>"Owasp Ror CheatSheet: Command Injection",
              :kind=>Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK,
              :applies=>["rails"],
              :glob=>"*.rb",
              :aux_links=>["https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet"],
              :message=>message,
              :attack_pattern => ["eval", "System", "\`", "Kernel.exec"],
              :avoid_comments => true
            })
            # @debug = true
          end
        end
      end
    end
  end
end
