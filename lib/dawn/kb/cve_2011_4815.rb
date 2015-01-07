module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-07-12
			class CVE_2011_4815
				include RubyVersionCheck

				def initialize
          message = "Ruby (aka CRuby) before 1.8.7-p357 computes hash values without restricting the ability to trigger hash collisions predictably, which allows context-dependent attackers to cause a denial of service (CPU consumption) via crafted input to an application that maintains a hash table."
          super({
            :name=>"CVE-2011-4815",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:C",
            :release_date => Date.new(2011, 12, 30),
            :cwe=>"20",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade your ruby to latest available version",
            :aux_links=>["http://www.ruby-lang.org/en/news/2011/12/28/denial-of-service-attack-was-found-for-rubys-hash-algorithm/"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p357"}]


				end
			end
		end
	end
end
