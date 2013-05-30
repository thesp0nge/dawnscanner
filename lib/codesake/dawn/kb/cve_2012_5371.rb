module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-30
			class CVE_2012_5371
				include RubyVersionCheck

				def initialize
          message="Ruby (aka CRuby) 1.9 before 1.9.3-p327 and 2.0 before r37575 computes hash values without properly restricting the ability to trigger hash collisions predictably, which allows context-dependent attackers to cause a denial of service (CPU consumption) via crafted input to an application that maintains a hash table, as demonstrated by a universal multicollision attack against a variant of the MurmurHash2 algorithm, a different vulnerability than CVE-2011-4815."
         super({
            :name=>"CVE-2012-5371",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2012, 11, 28),
            :cwe=>"310",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby interpreter to 1.9.3-p327 or 2.0.0-p195 or latest version available",
            :aux_links=>["http://www.ruby-lang.org/en/news/2012/11/09/ruby19-hashdos-cve-2012-5371/"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p327"}, {:engine=>"ruby", :version=>"2.0.0", :patchlevel=>"p195"}]
 
				end
			end
		end
	end
end
