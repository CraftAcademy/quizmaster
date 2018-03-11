Feature: Team can access the Quiz
  As a Team
  In order to play Quizmaster
  I need to be able to access the Quiz interface.

  Background:
    Given there is a quiz called "Trivia"
    And there is a quiz called "Trivia 2"
    And the application is running
    And there is a team named "Craft Academy" playing "Trivia"
    And there is a team named "Amber Rocks" playing "Trivia 2"

  Scenario: Viewing two quizzes
    Given I am on the quizmaster page for "Trivia"
    Given "Craft Academy" is looking at the quiz page for "Trivia"
    And "Amber Rocks" is looking at the quiz page for "Trivia 2"
    When I fill in "message" with "For Trivia only!"
    And I click the "Start the Quiz" button
    Then window 2 should see "For Trivia only!"
    And window 3 should not see "For Trivia only!"
    When I switch to window "1"
    And I am on the quizmaster page for "Trivia 2"
    And I fill in "message" with "Trivia 2 is awesome!"
    And I click the "Start the Quiz" button
    Then window 3 should see "Trivia 2 is awesome!"
    And window 2 should not see "Trivia 2 is awesome!"
