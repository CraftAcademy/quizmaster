Feature: As a Quizmaster
  in order to see all my quizzes and create new ones
  I must be able to view my dashboard.

Background:
  Given there is a user with email "viktoria@quizmaster.com"

Scenario: I view my dashboard
  Given I am on the quizmaster "Dashboard" page
  When I click the "Create a new quiz" button
  Then I should see "Create a new quiz"
