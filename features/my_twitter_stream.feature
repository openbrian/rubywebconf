Feature: My twitter stream
  Background:
    Given I am logged in as 'bj'

  Scenario: Blank stream
    Given an empty tweet stream
    When I go to my home page
    Then I should see 0 tweets
    And I should see "This user has not tweeted yet"

  Scenario: I have tweeted once
    Given I have tweeted "BJ is so smart"
    When I go to my home page
    Then I should see 1 tweet
    And I should see "BJ is so smart"
    And I should not see "This user has not tweeted yet"

  Scenario: Multiple tweets show up in reverse chronological order
    Given I have tweeted "BJ is so smart"
    And 5 minutes later I tweeted "Pat is a lot smarter"
    When I go to my home page
    Then I should see 2 tweets
    And I should see the following tweets in order:
      | tweet                |
      | Pat is a lot smarter |
      | BJ is so smart       |
