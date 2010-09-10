Feature: View other users twitter stream
  Scenario: Shows that user's tweets but not mine
    Given I have tweeted "this is my tweet"
    And "bj" has tweeted "BJ is so smart"
    When I go to "bj"'s twitter stream
    Then I should see 1 tweet
    And I should see "BJ is so smart"
    And I should not see "this is my tweet"
  