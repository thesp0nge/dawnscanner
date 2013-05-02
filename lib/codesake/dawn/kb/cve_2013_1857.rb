module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-02
			class CVE_2013_1857
				include PatternMatchCheck

        def initialize
          super({
            :fixes_version => ['2.3.18', '3.2.13', '3.1.12'], 
            :attack_pattern => ["sanitize"], 
            :name=>'CVE-2013-1857', 
            :applies=>["rails"],
            :kind => Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK
            :aux_links => [ "https://groups.google.com/d/msg/rubyonrails-security/zAAU7vGTPvI/1vZDWXqBuXgJ" ]
          })

        end
      end
    end
  end
end
