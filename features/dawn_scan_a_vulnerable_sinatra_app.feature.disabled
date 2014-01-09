Feature: dawn reports security issues 
  When it scans a sinatra application that it is not updated and it has XSS

  Scenario: dawn detects the sinatra version
    Given a vulnerable sinatra application exists
    When I run `bundle exec dawn /tmp/sinatra-vulnerable`
    Then the stdout should contain "1.2.6"

  Scenario: dawn tells there are no vulnerabilities
    Given a vulnerable sinatra application exists
    When I run `bundle exec dawn /tmp/sinatra-vulnerable`
    Then the stdout should contain "4 vulnerabilities found"
    And the stdout should contain "Not revised code failed"
    And the stdout should contain "CVE-2013-0269 failed"
    And the stdout should contain "CVE-2013-1800 failed"
    And the stdout should contain "1 reflected XSS found"
    And the stdout should contain "request parameter \"name\""

    # Test for --output json
  Scenario: dawn can give a brief json output as well
    Given a vulnerable sinatra application exists
    When I run `bundle exec dawn -s /tmp/sinatra-vulnerable --output json`
    Then the stdout should contain "{\"status\":"OK",\"target\":"/tmp/sinatra-vulnerable",\"mvc\":"sinatra",\"mvc_version\":"1.2.6",\"vulnerabilities_count\":4,\"vulnerabilities\":["Not revised code","CVE-2013-0269","CVE-2013-1800"],\"mitigated_vuln_count\":0,\"mitigated_vuln\":[],\"reflected_xss\":["request parameter \"name\""]}"


    # Tests for --count-only option
  Scenario: dawn can give just the number of issues found as output
    Given a vulnerable sinatra application exists
    When I run `bundle exec dawn --count-only -s /tmp/sinatra-vulnerable`
    Then the stdout should contain "4"

  Scenario: dawn can give just the number of issues found as output
    Given a vulnerable sinatra application exists
    When I run `bundle exec dawn --count-only -s /tmp/sinatra-vulnerable --output json`
    Then the stdout should contain "{\"status\":"OK",\"vulnerabilities_count\":4}"

