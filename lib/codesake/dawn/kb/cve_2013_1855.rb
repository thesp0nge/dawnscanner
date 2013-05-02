module Codesake
  module Dawn
    module Kb
      class CVE_2013_1855 
        include PatternMatchCheck

        def initialize
          super({
            :fixes_version => ['2.3.18', '3.2.13', '3.1.12'], 
            :attack_pattern => ["sanitize_css"], 
            :name=>'CVE-2013-1855', 
            :applies=>["rails"],
            :kind => Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK,
            :aux_links => ["https://groups.google.com/d/msg/rubyonrails-security/4_QHo4BqnN8/_RrdfKk12I4J"]
          })
        end
      end
    end
  end
end
