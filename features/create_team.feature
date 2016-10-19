Feature: As a Player
  in order to join the game
  I need to be able to setup a Team.

  Background:
    Given there is a quiz called "Trivia"

  Scenario: Creating a Team
    Given I am on the page for "Trivia"
    When I enter "Eliten"
    And I press the "Create Team" button
    Then I should see "Successfully created team!"
