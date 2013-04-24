module Codesake
  module Dawn
    module Kb
      class CVE_2013_1800  
        include DependencyCheck
        
        def initialize
          super({:name=>"CVE-2013-1800", 
                :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P", 
                :release_date => Date.new(2013, 4, 9),
                :cwe=>"264",
                :owasp=>"A9", 
                :applies=>["sinatra", "padrino", "rails"],
                :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK
          })
          self.fixed_dependency = {:name=>'crack', :version=>['0.3.2']}
        end

      end
    end
  end
end
