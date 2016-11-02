Feature: As a Quizmaster
  in order to create a quiz
  I need to be able to fill in/create my questions.

Background:
  Given there is a quizmaster with email "viktoria@quizmaster.com"
  And I am logged in as "viktoria@quizmaster.com"

Scenario: I add a question
  Given I am on the quizmaster "Create quiz" page
  When I fill in "Question" with "Why is Viktoria so nice?"
  And I fill in "Answer" with "Because she is polish"
  And I click the "Submit" button
  Then I should see "Successfully created quiz"
