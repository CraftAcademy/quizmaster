Feature: Player can join the game
  As a Player
  in order to join the game
  I need to be able to setup a Team.

  Background:
    Given there is a quiz called "Trivia"

  Scenario: Creating a Team
    Given I am on the quiz page for "Trivia"
    When I fill in "team_name" with "Eliten"
    And I click the "Create Team" button
    And I should not see "Enter your teamname and press the button!"
    Then I should see "Get ready for the quiz, Eliten!"
