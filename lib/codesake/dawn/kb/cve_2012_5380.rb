module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-07-15
			class CVE_2012_5380
				include RubyVersionCheck

				def initialize
          message = "** DISPUTED ** Untrusted search path vulnerability in the installation functionality in Ruby 1.9.3-p194, when installed in the top-level C:\ directory, might allow local users to gain privileges via a Trojan horse DLL in the C:\Ruby193\bin directory, which may be added to the PATH system environment variable by an administrator, as demonstrated by a Trojan horse wlbsctrl.dll file used by the \"IKE and AuthIP IPsec Keying Modules\" system service in Windows Vista SP1, Windows Server 2008 SP2, Windows 7 SP1, and Windows 8 Release Preview. NOTE: CVE disputes this issue because the unsafe PATH is established only by a separate administrative action that is not a default part of the Ruby installation."
           super({
            :name=>"CVE-2012-5380",
            :cvss=>"AV:L/AC:H/Au:S/C:C/I:C/A:C",
            :release_date => Date.new(2012, 10, 11),
            :cwe=>"426",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Upgrade ruby to the latest 1.9.3 patch or even better use ruby 2.x",
            :aux_links=>["https://www.htbridge.com/advisory/HTB23108"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p195"}]


				end
			end
		end
	end
end
