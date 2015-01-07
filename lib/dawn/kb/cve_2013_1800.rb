module Codesake
  module Dawn
    module Kb
      class CVE_2013_1800  
        include DependencyCheck
        

        def initialize

          message = "The crack gem 0.3.1 and earlier for Ruby does not properly restrict casts of string values, which might allow remote attackers to conduct object-injection attacks and execute arbitrary code, or cause a denial of service (memory and CPU consumption) by leveraging Action Pack support for (1) YAML type conversion or (2) Symbol type conversion, a similar vulnerability to CVE-2013-0156."

          super({:name=>"CVE-2013-1800", 
                :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P", 
                :release_date => Date.new(2013, 4, 9),
                :cwe=>"264",
                :owasp=>"A9", 
                :applies=>["sinatra", "padrino", "rails"],
                :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
                :message=>message,
                :mitigation=>"Please use crack gem version 0.3.2 or above. Correct your gemfile"
          })
          self.safe_dependencies = [{:name=>'crack', :version=>['0.3.2']}]
        end

      end
    end
  end
end
