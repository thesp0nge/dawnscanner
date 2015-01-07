module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-12-17
			class CVE_2013_6421
				include DependencyCheck

				def initialize
          message = "The unpack_zip function in archive_unpacker.rb in the sprout gem 0.7.246 for Ruby allows context-dependent attackers to execute arbitrary commands via shell metacharacters in a (1) filename or (2) path."

           super({
            :name=>'CVE-2013-6421', 
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",  
            :release_date => Date.new(2013, 12, 12),
            :cwe=>"94", 
            :owasp=>"A9",
            :applies=>["rails", "padrino", "sinatra"],
            :kind => Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message => message,
            :mitigation=>"Please upgrade sprout rubygem",
            :aux_links => ["http://www.openwall.com/lists/oss-security/2013/12/03/1"]
          })
          self.safe_dependencies = [{:name=>"sprout", :version=>['0.7.247']}]


				end
			end
		end
	end
end
