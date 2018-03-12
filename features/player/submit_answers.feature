Feature: Team can play the game
  As a Team
  In order to participate in the game
  I need to be able to submit Answers.

  Background:
    Given there is a quiz called "Trivia"
    And the following questions exist in "Trivia":
      | body            | answer       |
      | What is 2+2?    | Four         |
      | Who is awesome? | Thomas is ok |
    And I close all active windows
    And the application is running
    And there is a team named "Craft Academy" playing "Trivia"

  Scenario: I submit my answer
    Given I receive the first question
    When I fill in "body" with "Four"
    And I click the "Submit" button
    Then there should be "1" answer for the "Craft Academy" team
    Then I should see "Answer submitted!"
