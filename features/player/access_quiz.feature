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

  Scenario: Access quiz and subscribe to channel
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"
    And I should see "Welcome to quiz: Trivia"
    And I should see a Create Team form

  Scenario: I put in the wrong code
    Given I am on the quiz "landing" page
    And I enter a bad code
    And I should see "Invalid code. Talk to your Quizmaster."

  Scenario: Access quiz and subscribe to channel
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"
    And I should see "Welcome to quiz: Trivia"
    When I fill in "Team Name" with "Craft Academy"
    And I press the "Create Team" button
    And I should see "Questions will appear here."

  Scenario: Receive initial "Quiz is starting" message
    Given there is a "team_id" cookie set to "Craft Academy"
    And I am on the quiz "landing" page
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"

