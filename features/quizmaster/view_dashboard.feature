Feature: As a Quizmaster
  in order to see all my quizzes and create new ones
  I must be able to view my dashboard.

Background:
  Given there is a user with email "viktoria@quizmaster.com"
  And there is a user with email "amber@quizmaster.com"
  And "viktoria@quizmaster.com" have the following quiz
  | name    |
  | General |


Scenario: I view my dashboard
  Given I log in as "viktoria@quizmaster.com"
  And I am on the quizmaster "Dashboard" page
  Then I should see "General"
  When I click the "Create a new quiz" button
  Then I should see "Create a new quiz"

Scenario: Amber should not see my quizzes
  Given I log in as "amber@quizmaster.com"
  And I am on the quizmaster "Dashboard" page
  Then I should not see "General"
