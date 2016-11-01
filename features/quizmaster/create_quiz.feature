Feature: As a Quizmaster
  in order to add questions to a quiz
  I must be able to create a quiz.

Background:
  Given there is a quizmaster with email "viktoria@quizmaster.com"
  And I am logged in as "viktoria@quizmaster.com"


Scenario: I create a quiz
  Given I am on the quizmaster "Create quiz" page
  When I fill in "Name" with "Team Craft Academy"
  And I click the "Create" button
  Then "viktoria@quizmaster.com" should have 1 quiz



# Scenario: I add questions to my quiz
#   Given I am on the quizmaster Add questions page for "Team Craft Academy"
#   When I fill in "Question" with "Is Viktoria awesome?"
#   And I click the "Add question" button
#   Then I should see "You made a question! Great!"
