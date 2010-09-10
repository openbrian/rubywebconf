Feature: Following users
  Background:
    Given I am logged in as 'bj'

  Scenario: Following a user shows his tweets on my home page
    Given 'bj' is following 'pat'
    And "pat" has tweeted "Hello RubyWeb conference!"
    When I go to my home page
    Then I should see "Hello RubyWeb conference! - @pat"