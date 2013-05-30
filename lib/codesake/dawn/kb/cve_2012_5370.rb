module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-30
			class CVE_2012_5370
				include RubyVersionCheck

				def initialize
          message="JRuby computes hash values without properly restricting the ability to trigger hash collisions predictably, which allows context-dependent attackers to cause a denial of service (CPU consumption) via crafted input to an application that maintains a hash table, as demonstrated by a universal multicollision attack against the MurmurHash2 algorithm, a different vulnerability than CVE-2011-4838."
           super({
            :name=>"CVE-2012-5370",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
            :release_date => Date.new(2012, 11, 28),
            :cwe=>"310",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"At the moment we're writing this (May 2013) there is no mitigation against this vulnerability. You must consider changing your hashing algorithm",
            :aux_links=>["https://bugzilla.redhat.com/show_bug.cgi?id=880671"]
          })

          self.safe_rubies = [{:engine=>"jruby", :version=>"999.999.999", :patchlevel=>"p999"}]

				end
			end
		end
	end
end
