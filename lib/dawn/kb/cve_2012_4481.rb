module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-05-31
			class CVE_2012_4481
				include RubyVersionCheck

				def initialize
          message="The safe-level feature in Ruby 1.8.7 allows context-dependent attackers to modify strings via the NameError#to_s method when operating on Ruby objects. NOTE: this issue is due to an incomplete fix for CVE-2011-1005."
          super({
            :name=>"CVE-2012-4481",
            :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
            :release_date => Date.new(2013, 5, 2),
            :cwe=>"264",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby interpreter to 1.9.3 or 2.0.0 or latest version available",
            :aux_links=>["https://bugzilla.redhat.com/show_bug.cgi?id=863484"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p9999"}]
				end
			end
		end
	end
end
