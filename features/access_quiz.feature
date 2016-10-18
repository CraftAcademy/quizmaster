@javascript
Feature: As a Team
  in order to play Quizmaster
  I need to be able to access the Quiz interface.

  Background:
    Given there is a quiz called "Trivia"

  Scenario: Access quiz and subscribe to channel
    Given I am on the quiz "landing" page
    And I enter the code for "Trivia"
    #Then a message "Welcome to quiz: Trivia" should be broadcasted
    Then I should be on the quiz page for "Trivia"
    Then show me the page
    And I should see "Welcome to quiz: Trivia"