Feature: As a Quizmaster
  in order create a quiz
  I need to be able to log in.

Scenario: I register a new account
  Given I am on the landing page for quizmaster
  Then I should see "Play the game"
  When I click the "Log in as Quizmaster" link
  Then I should be on the Log in page
