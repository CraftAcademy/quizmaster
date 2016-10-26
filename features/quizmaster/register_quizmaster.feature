Feature: As a Quizmaster
  in order create a quiz
  I need to be able to register.

Scenario: I register a new account
  Given I am on the landing page for quizmaster
  Then I should see "Register as a Quizmaster"
  When I click the "Register as a Quizmaster" link
  Then I should be on the Register page
