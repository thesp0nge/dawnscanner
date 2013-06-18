Feature: dawn complains on its command line when incomplete
  When executed dawn needs a target to analyse

  Scenario: dawn complains if you don't specify the target framework
    When I run `bundle exec dawn`
    Then the stderr should contain "missing target"

  Scenario: dawn complains if you don't specify the target
    When I run `bundle exec dawn -s`
    Then the stderr should contain "missing target"

  Scenario: dawn complains if the target doesn't exist
    Given the generic project "/tmp/this_is_foo" doesn't exist
    When I run `bundle exec dawn -s /tmp/this_is_foo`
    Then the stderr should contain "invalid directory (/tmp/this_is_foo)"

  Scenario: dawn complains if the target uses a different framework than the one specified
    Given the hello world rails project does exist
    When I run `bundle exec dawn -s /tmp/hello_world_3.2.13`
    Then the stderr should contain "nothing to do on /tmp/hello_world_3.2.13"

