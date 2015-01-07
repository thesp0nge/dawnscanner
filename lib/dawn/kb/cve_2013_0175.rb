module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-21
			class CVE_2013_0175
				include DependencyCheck

				def initialize
          message = "multi_xml gem 0.5.2 for Ruby, as used in Grape before 0.2.6 and possibly other products, does not properly restrict casts of string values, which allows remote attackers to conduct object-injection attacks and execute arbitrary code, or cause a denial of service (memory and CPU consumption) involving nested XML entity references, by leveraging support for (1) YAML type conversion or (2) Symbol type conversion, a similar vulnerability to CVE-2013-0156."

           super({
            :name=>'CVE-2013-0175', 
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",  
            :release_date => Date.new(2013, 4, 25),
            :cwe=>"20", 
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade multi_xml gem or grape gem",
            :aux_links => ["https://groups.google.com/forum/?fromgroups=#%21topic/ruby-grape/fthDkMgIOa0"]
          })
          self.safe_dependencies = [{:name=>"multi_xml", :version=>['0.5.3']}, {:name=>"grape", :version=>['0.2.6']}]

				end
			end
		end
	end
end
