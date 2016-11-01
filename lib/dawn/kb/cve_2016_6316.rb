module Dawn
  module Kb
    # Automatically created with rake on 2016-10-02
    class CVE_2016_6316
      include DependencyCheck

      def initialize
        title   = "Possible XSS Vulnerability in Action View"
        message = "Text declared as \"HTML safe\" when passed as an attribute value to a tag helper will not have quotes escaped which can lead to an XSS attack."
        super({
          :title=>title,
          :name=> "CVE-2016-6316",
          :cve=>"2016-6316",
          :osvdb=>"",
          :cvss=>"AV:N/AC:M/Au:N/C:N/I:P/A:N",
          :release_date => Date.new(2016, 8, 11),
          :cwe=>"",
          :owasp=>"A9",
          :applies=>["rails", "sinatra", "padrino"],
          :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
          :message=>message,
          :mitigation=>"Please upgrade actionview gem to version 3.2.22.3, 4.2.7.1, 5.0.0.1 or install latest version.",
          :aux_links=>['https://groups.google.com/forum/#!topic/rubyonrails-security/I-VWr034ouk']
        })
        self.safe_dependencies = [{:name=>"actionview", :version=>['3.2.22.3', '4.2.7.1', '5.0.0.1']}]
        self.not_affected = {:name=>"actionview", :version=>['1.x.x', '2.x.x']}

        self.save_minor=true
        self.save_major=true
      end
    end
  end
end
