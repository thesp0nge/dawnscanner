module Codesake
  module Dawn
    module Kb
      class NotRevisedCode
        include PatternMatchCheck


        def initialize
          super({:name=>"Not revised code",
                :cvss=>"",
                :release_date=>nil,
                :cwe=>"",
                :owasp=>"",
                :applies=>["sinatra", "rails", "padrino"],
                :kind=>Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK,
                :message=>"Analyzing comments, it seems your code is waiting from some review from you. Please consider take action before putting it in production.\nThis check will analyze the source code looking for the following patterns: XXX, TO_CHECK, CHECKME, CHECK and FIXME",
                :mitigation=>"Please review the file fixing the issue.",
                :attack_pattern => ["XXX", "TO_CHECK", "CHECKME", "CHECK", "FIXME"]
          })
        end
      end
    end
  end
end
