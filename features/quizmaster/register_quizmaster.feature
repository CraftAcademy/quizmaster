Feature: As a Quizmaster
  in order create a quiz
  I need to be able to log in.

Scenario: I register a new account
  Given I am on the landing page for quizmaster
  Then I should see "Play the game"
  When I click the "Log in as Quizmaster" link
  Then I should be on the Log in page
  And I click the "Sign up" link
  Then I should see "Sign up"
  When I fill in "Email" with "viktoria@quizmaster.com"
  And I fill in "Password" with "password"
  And I fill in "Password confirmation" with "password"
  And I click the "Sign up" button
  Then I should see "Welcome! You have signed up successfully."
