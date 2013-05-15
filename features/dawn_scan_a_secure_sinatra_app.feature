Feature: dawn reports no security issues 
  When it scans a sinatra application that it is updated and it has no XSS

  Scenario: dawn detects the sinatra version
    Given a safe sinatra application exists
    When I run `bundle exec dawn -s /tmp/sinatra-safe`
    Then the stdout should contain "sinatra 1.4.2"

  Scenario: dawn tells there are no vulnerabilities
    Given a safe sinatra application exists
    When I run `bundle exec dawn -s /tmp/sinatra-safe`
    Then the stdout should contain "0 vulnerabilities found"

    # Test for --output json
  Scenario: dawn can give a brief json output as well
    Given a safe sinatra application exists
    When I run `bundle exec dawn -s /tmp/sinatra-safe --output json`
    Then the stdout should contain "{:target=>"/tmp/sinatra-safe", :version=>"1.4.2", :issues_found=>0, :issues=>[]}"


    # Tests for --count-only option
  Scenario: dawn can give just the number of issues found as output
    Given a safe sinatra application exists
    When I run `bundle exec dawn --count-only -s /tmp/sinatra-safe`
    Then the stdout should contain "0"

  Scenario: dawn can give just the number of issues found as output
    Given a safe sinatra application exists
    When I run `bundle exec dawn --count-only -s /tmp/sinatra-safe --output json`
    Then the stdout should contain "{:target=>"/tmp/sinatra-safe", :issues_found=>0}"

