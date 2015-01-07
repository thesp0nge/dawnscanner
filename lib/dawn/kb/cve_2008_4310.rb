module Codesake
	module Dawn
		module Kb
			class CVE_2008_4310_a
        include RubyVersionCheck
        def initialize
          message = "CVE_2008_4310_a: ruby 1.8.1 and 1.8.5 have problems"
          super({
            :name=>"CVE-2008_4310_a",
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
          })
          self.safe_rubies = [
            {:engine=>"ruby", :version=>"1.8.1", :patchlevel=>"p999"}, 
            {:engine=>"ruby", :version=>"1.8.5", :patchlevel=>"p999"}
          ]
        end
      end

      class CVE_2008_4310_b
        include OperatingSystemCheck

        def initialize

          message =  "CVE_2008_4310_b: Only on RedHat EL 4 and 5"

          super({
            :name=>"CVE-2008_4310_b",
            :kind=>Codesake::Dawn::KnowledgeBase::OS_CHECK,
          })

            self.safe_os=[
              #RHEL 5.10
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.18-371']},             
              #RHEL 5.9
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.18-348']}, 
              #RHEL 5.8
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.18-308']},  
              #RHEL 5.7
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.18-274']},
              #RHEL 5.6
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.18-238']}, 
              #RHEL 5.5
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.18-194']}, 
              #RHEL 5.4            
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.18-164']}, 
              #RHEL 5.3 
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.18-128']},  
              #RHEL 5.2
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.18-92']},  
              #RHEL 5.1
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.18-53']},   
              #RHEL 5.0
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.18-8']}, 
              #RHEL 4.9           
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.9-100']},
              #RHEL 4.8
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.9-89']}, 
              #RHEL 4.7
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.9-78']}, 
              #RHEL 4.6
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.9-67']},
              #RHEL 4.5 
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.9-55']}, 
              #RHEL 4.4
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.9-42']}, 
              #RHEL 4.3
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.9-34']}, 
              #RHEL 4.2
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.9-22']}, 
              #RHEL 4.1
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.9-11']}, 
              #RHEL 4.0
              {:family=>"linux", :vendor=>"redhat", :version=>['2.6.9-5']}
            ]
        end
      end

			class CVE_2008_4310
        include ComboCheck

				def initialize
          message = "httputils.rb in WEBrick in Ruby 1.8.1 and 1.8.5, as used in Red Hat Enterprise Linux 4 and 5, allows remote attackers to cause a denial of service (CPU consumption) via a crafted HTTP request. NOTE: this issue exists because of an incomplete fix for CVE-2008-3656."
          
          super({
            :name=>"CVE-2008-4310",
            :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:C",
            :release_date => Date.new(2008, 12, 9),
            :cwe=>"399",
            :owasp=>"A9", 
            :applies=>["sinatra", "padrino", "rails"],
            :kind=>Codesake::Dawn::KnowledgeBase::COMBO_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade your ruby interpreter",
            :aux_links=>["http://secunia.com/advisories/33013"],
            :checks=>[CVE_2008_4310_a.new, CVE_2008_4310_b.new]
          })

				end
			end
		end
	end
end

