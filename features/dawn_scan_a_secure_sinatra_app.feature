Feature: dawn reports no security issues 
  When it scans a sinatra application that it is updated and it has no XSS

  Scenario: dawn detects the sinatra version
    Given a safe sinatra application exists
    When I run `bundle exec dawn /tmp/sinatra-safe`
    Then the stdout should contain "1.4.2"

  Scenario: dawn tells there are no vulnerabilities
    Given a safe sinatra application exists
    When I run `bundle exec dawn /tmp/sinatra-safe`
    Then the stdout should contain "no vulnerabilities found"

    # Test for --output json
  Scenario: dawn can give a brief json output as well
    Given a safe sinatra application exists
    When I run `bundle exec dawn -s /tmp/sinatra-safe --output json`
    Then the stdout should contain "{\"status\":"OK",\"target\":"/tmp/sinatra-safe",\"mvc\":"sinatra",\"mvc_version\":"1.4.2",\"vulnerabilities_count\":0,\"vulnerabilities\":[],\"mitigated_vuln_count\":0,\"mitigated_vuln\":[],\"reflected_xss\":[]}"


    # Tests for --count-only option
  Scenario: dawn can give just the number of issues found as output
    Given a safe sinatra application exists
    When I run `bundle exec dawn --count-only -s /tmp/sinatra-safe`
    Then the stdout should contain "0"

  Scenario: dawn can give just the number of issues found as output
    Given a safe sinatra application exists
    When I run `bundle exec dawn --count-only -s /tmp/sinatra-safe --output json`
    Then the stdout should contain "{\"status\":"OK",\"vulnerabilities_count\":0}"

