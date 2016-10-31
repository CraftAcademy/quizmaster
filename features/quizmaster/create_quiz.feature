Feature: As a Quizmaster
  in order to add questions to a quiz
  I must be able to create a quiz.

Background:
  Given there is a quizmaster with email "viktoria@quizmaster.com"

Scenario: I create a quiz
  Given I am on the quizmaster "Create quiz" page
  When I fill in "Question" with "Is Viktoria awesome?"
  And I click the "Create quiz" button
  Then I should see "You just created a new quiz! Nice!"
