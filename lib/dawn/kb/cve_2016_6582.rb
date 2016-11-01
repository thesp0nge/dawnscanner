module Dawn
  module Kb
    # Automatically created with rake on 2016-10-02
    class CVE_2016_6582
      # Include the testing skeleton for this CVE
      # include PatternMatchCheck
      include DependencyCheck
      # include RubyVersionCheck

      def initialize
        title   = "Doorkeeper gem does not revoke tokens & uses wrong auth/auth method"
        message = "Doorkeeper failed to implement OAuth 2.0 Token Revocation (RFC 7009) in the following ways:

Public clients making valid, unauthenticated calls to revoke a token would not have their token revoked
Requests were not properly authenticating the client credentials but were, instead, looking at the access token in a second location
Because of 2, the requests were also not authorizing confidential clients’ ability to revoke a given token. It should only revoke tokens that belong to it.
The security implication is: OAuth 2.0 clients who \"log out\" a user expect to have the corresponding access & refresh tokens revoked, preventing an attacker who may have already hijacked the session from continuing to impersonate the victim. Because of the bug described above, this is not the case. As far as OWASP is concerned, this counts as broken authentication design.

MITRE has assigned CVE-2016-6582 due to the security issues raised. An attacker, thanks to 1, can replay a hijacked session after a victim logs out/revokes their token. Additionally, thanks to 2 & 3, an attacker via a compromised confidential client could \"grief\" other clients by revoking their tokens (albeit this is an exceptionally narrow attack with little value)."


        super({
          :title=>title,
          :name=> "CVE-2016-6582",
          :cve=>"",
          :osvdb=>"",
          :cvss=>"",
          :release_date => Date.new(2016, 8, 18),
          :cwe=>"",
          :owasp=>"A9",
          :applies=>["rails", "sinatra", "padrino"],
          :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
          :message=>message,
          :mitigation=>"Please upgrade doorkeeper gem to version 4.2.0 or later.",
          :aux_links=>['http://www.openwall.com/lists/oss-security/2016/08/19/2']
        })
        self.safe_dependencies = [{:name=>"doorkeeper", :version=>['4.2.0']}]


      end
    end
  end
end
