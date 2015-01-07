module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-12-17
			class CVE_2013_4479
				include DependencyCheck

				def initialize
          message = "lib/sup/message_chunks.rb in Sup before 0.13.2.1 and 0.14.x before 0.14.1.1 allows remote attackers to execute arbitrary commands via shell metacharacters in the content_type of an email attachment."
          super({
            :name=>'CVE-2013-4479', 
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",  
            :release_date => Date.new(2013, 12, 7),
            :cwe=>"94", 
            :owasp=>"A9",
            :applies=>["rails", "padrino", "sinatra"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade sup rubygem",
            :aux_links => ["http://www.openwall.com/lists/oss-security/2013/10/30/2"]
          })
          self.safe_dependencies = [{:name=>"sup", :version=>['0.13.2.1', '0.14.1.1']}]

				end
			end
		end
	end
end
