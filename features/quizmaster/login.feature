Feature: As a Quizmaster
  in order create a quiz
  I need to be able to Login.

Background:
  Given there is a quizmaster with email "viktoria@quizmaster.com"

Scenario: I Login
  Given I am on the quizmaster "Log in" page
  Then I fill in "Email" with "viktoria@quizmaster.com"
  And I fill in "Password" with "password"
  And I click the "Log in" button
  Then I should see "Signed in successfully."

Scenario: I attempt to log in with the wrong credentials
  Given I am on the quizmaster "Log in" page
  Then I fill in "Email" with "viktoria@quizrunner.com"
  And I fill in "Password" with "password"
  And I click the "Log in" button
  Then I should be on the "quizmaster login" page
  And I should see "Invalid Email or password."
