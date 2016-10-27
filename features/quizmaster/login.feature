Feature: As a Quizmaster
  in order create a quiz
  I need to be able to Login.

Background:
Given there is a user with email "viktoria@quizmaster.com"

Scenario: I Login
  Given I am on the quizmaster "Log in" page
  Then I fill in "Email" with "viktoria@quizmaster.com"
  And I fill in "Password" with "password"
  And I click the "Log in" button
  Then I should see "Signed in successfully."
