Feature: dawn complains on its command line whn incomplete
  When executed dawn needs a target to analyse

  Scenario: dawn complains if you don't specify the target framework
    #Given an empty command line
    When I run `bundle exec dawn`
    Then the stderr should contain "missing target framework flag"

