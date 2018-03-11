Feature: Team can access the Quiz
  As a Team
  In order to play Quizmaster
  I need to be able to access the Quiz interface.

  Background:
    Given there is a quiz called "Trivia"
    And there is a quiz called "Trivia 2"
    And I close all active windows
    And the application is running
    And there is a team named "Craft Academy" playing "Trivia"

  Scenario: Receive initial Quiz welcome message
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"
    And I fill in "Team Name" with "Craft Academy"
    And I press the "Create Team" button
    And I switch to a new window
    And I am on the quizmaster page for "Trivia"
    When I fill in "message" with "The Quiz begins!"
    And I click the "Start the Quiz" button
    And I switch to window "1"
    Then I should see "The Quiz begins!"

