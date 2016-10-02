module Dawn
  module Kb
    # Automatically created with rake on 2016-10-02
    class CVE_2016_5697
      include DependencyCheck

      def initialize
        title   = "XML signature wrapping attack"
        message = "ruby-saml prior to version 1.3.0 is vulnerable to an XML signature wrapping attack in the specific scenario where there was a signature that referenced at the same time 2 elements (but past the scheme validator process since 1 of the element was inside the encrypted assertion)."
        super({
          :title=>title,
          :name=> "CVE-2016-5697",
          :cve=>"2016-5697",
          :osvdb=>"",
          :cvss=>"",
          :release_date => Date.new(2016, 6, 24),
          :cwe=>"",
          :owasp=>"A9",
          :applies=>["rails", "sinatra", "padrino"],
          :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
          :message=>message,
          :mitigation=>"Please upgrade ruby-saml gem to version 1.3.0 which implements 3 extra validations to mitigate this kind of attack.",
          :aux_links=>['https://github.com/onelogin/ruby-saml/commit/a571f52171e6bfd87db59822d1d9e8c38fb3b995']
        })
        self.safe_dependencies = [{:name=>"ruby-saml", :version=>['1.3.0']}]

      end
    end
  end
end
