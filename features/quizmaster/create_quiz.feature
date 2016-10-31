Feature: As a Quizmaster
  in order to add questions to a quiz
  I must be able to create a quiz.

Background:
  Given there is a quizmaster with email "viktoria@quizmaster.com"

Scenario: I create a quiz
  Given I am on the quizmaster "Create quiz" page
  When I fill in "Quiz name" with "Team Craft Academy"
  And I click the "Create quiz" button
  Then I should see "Add questions"

Scenario: I add questions to my quiz
  Given I am on the quizmaster Add questions page for "Team Craft Academy"
  When I fill in "Question" with "Is Viktoria awesome?"
  And I click the "Add question" button
  Then I should see "You made a question! Great!"
