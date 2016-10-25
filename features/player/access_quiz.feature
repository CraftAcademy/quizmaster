@javascript @action_cable

Feature: As a Team
  in order to play Quizmaster
  I need to be able to access the Quiz interface.

  Background:
    Given there is a quiz called "Trivia"
    And there is a quiz called "Trivia 2"
    And there is a team named "Craft Academy" playing "Trivia"
    And there is a team named "Amber Rocks" playing "Trivia 2"

  Scenario: Access quiz and subscribe to channel
    Given I am on the quiz "landing" page
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"
    And I should see "Welcome to quiz: Trivia"
    And I should see a Create Team form

  Scenario: Access quiz and subscribe to channel
    Given there is a "team_id" cookie set to "Craft Academy"
    Given I am on the quiz "landing" page
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"
    And I should see "Welcome to quiz: Trivia"
    And I should see "Get ready for the quiz, Craft Academy!"
    And I should see "Questions will appear here."

  Scenario: Receive initial "Quiz is starting" message
    Given there is a "team_id" cookie set to "Craft Academy"
    And I am on the quiz "landing" page
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"

  Scenario: Accessing two quizzes in separate windows
    Given I am on the quiz page for "Trivia"
    And I switch to a new window
    And I am on the quiz page for "Trivia 2"
    Then I should see "Trivia 2"
    And I switch to window "1"
    Then I should see "Trivia"
    Then I should have "2" active windows

  Scenario: Receive initial Quiz welcome message
    Given I am on the quiz "landing" page
    And there is a "team_id" cookie set to "Craft Academy"
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"
    And I switch to a new window
    And I am on the quizmaster page for "Trivia"
    When I fill in "message" with "The Quiz begins!"
    And I click the "Start the Quiz" button
    And I switch to window "1"
    Then I should see "The Quiz begins!"

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
