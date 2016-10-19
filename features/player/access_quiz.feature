@javascript
Feature: As a Team
  in order to play Quizmaster
  I need to be able to access the Quiz interface.

  Background:
    Given there is a quiz called "Trivia"
    And there is a quiz called "Trivia 2"

  Scenario: Access quiz and subscribe to channel
    Given I am on the quiz "landing" page
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"
    And I should see "Welcome to quiz: Trivia"
    And I should see a Create Team form


  Scenario: Access quiz and subscribe to channel
    Given there is a "team_id" cookie set to "1"
    Given I am on the quiz "landing" page
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"
    And I should see "Welcome to quiz: Trivia"
    And I should see "Welcome back team"

  Scenario: Receive initial "Quiz is starting" message
    Given there is a "team_id" cookie set to "1"
    And I am on the quiz "landing" page
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"
    # When the quizmaster starts the quiz
    # Then I should see "The Quiz is starting!"

  Scenario: Accessing two quizzes in separate windows
    Given I am on the quiz page for "Trivia"
    And I switch to a new window
    And I am on the quiz page for "Trivia 2"
    Then I should see "Trivia 2"
    And I switch to window "1"
    Then I should see "Trivia"
    Then I should have "2" active windows

  @action_cable
  Scenario: Receive initial Quiz welcome message
    Given I am on the quiz "landing" page
    And I enter the code for "Trivia"
    Then I should be on the quiz page for "Trivia"
    And I fill in "team[name]" with "Awesome"
    Then I should see my text "Awesome"
    And I switch to a new window
    And I am on the quizmaster page for "Trivia"
    When I fill in "message" with "The Quiz begins!"
    And I click the "Start the Quiz" button
    And I switch to window "1"
    Then I should see my text "Awesome"
    # And show me the page
    Then I should see "The Quiz begins!"
