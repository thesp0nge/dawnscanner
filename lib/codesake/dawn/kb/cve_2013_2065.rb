module Codesake
	module Dawn
		module Kb
			# Automatically created with rake on 2013-10-22
			class CVE_2013_2065
				include RubyVersionCheck

				def initialize
          message = "Native functions exposed to Ruby with DL or Fiddle do not check the taint values set on the objects passed in. This can result in tainted objects being accepted as input when a SecurityError exception should be raised."

          # TODO: fix links and info
          super({
            :name=>"CVE-2013-2065",
            :cvss=>"",
            :release_date => Date.new(2013, 5, 14),
            :cwe=>"264",
            :owasp=>"A9", 
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade ruby interpreter to 1.9.3-p436 or 2.0.0-p195 or latest version available",
            :aux_links=>["https://www.ruby-lang.org/en/news/2013/05/14/taint-bypass-dl-fiddle-cve-2013-2065/"]
          })

          self.safe_rubies = [{:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p426"}, {:engine=>"ruby", :version=>"2.0.0", :patchlevel=>"p195"}]

				end
			end
		end
	end
end
