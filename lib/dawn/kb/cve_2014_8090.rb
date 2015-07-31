module Dawn
  module Kb
    # Automatically created with rake on 2015-07-31
    class CVE_2014_8090
      include RubyVersionCheck

      def initialize
        message = "The REXML parser in Ruby 1.9.x before 1.9.3 patchlevel 551, 2.0.x before 2.0.0 patchlevel 598, and 2.1.x before 2.1.5 allows remote attackers to cause a denial of service (CPU and memory consumption) a crafted XML document containing an empty string in an entity that is used in a large number of nested entity references, aka an XML Entity Expansion (XEE) attack. NOTE: this vulnerability exists because of an incomplete fix for CVE-2013-1821 and CVE-2014-8080."

        super({
          :name=>"CVE-2014-8090",
          :cvss=>"AV:N/AC:L/Au:N/C:N/I:N/A:P",
          :release_date => Date.new(2014, 11, 21),
          :cwe=>"611",
          :owasp=>"A9",
          :applies=>["rails", "sinatra", "padrino"],
          :kind=>Dawn::KnowledgeBase::RUBY_VERSION_CHECK,
          :message=>message,
          :mitigation=>"Please upgrade ruby interpreter to 1.9.3-p551 or 2.0.0-p598 or 2.1.5. Please note that latest 2.2.x version is suggested.",
          :aux_links=>["https://www.ruby-lang.org/en/news/2014/11/13/rexml-dos-cve-2014-8090/"]
        })

        self.safe_rubies = [{:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p551"},
                            {:engine=>"ruby", :version=>"2.0.0", :patchlevel=>"p598"},
                            {:engine=>"ruby", :version=>"2.1.5", :patchlevel=>"p0"}]

      end
    end
  end
end
