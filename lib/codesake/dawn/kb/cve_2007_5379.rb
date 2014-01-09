module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2014-01-09
			class CVE_2007_5379
				include DependencyCheck

				def initialize
          message = "Rails before 1.2.4, as used for Ruby on Rails, allows remote attackers and ActiveResource servers to determine the existence of arbitrary files and read arbitrary XML files via the Hash.from_xml (Hash#from_xml) method, which uses XmlSimple (XML::Simple) unsafely, as demonstrated by reading passwords from the Pidgin (Gaim) .purple/accounts.xml file."
          super({
            :name=>"CVE-2007-5379",
            :cvss=>"AV:N/AC:L/Au:N/C:P/I:N/A:N",
            :release_date => Date.new(2007, 10, 19),
            :cwe=>"200",
            :owasp=>"A9", 
            :applies=>["rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 1.2.4 or higher. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["http://weblog.rubyonrails.org/2007/10/5/rails-1-2-4-maintenance-release"]
          })

          self.safe_dependencies = [{:name=>"rails", :version=>['1.2.4']}]

				end
			end
		end
	end
end
