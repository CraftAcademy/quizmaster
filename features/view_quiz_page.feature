Feature: As a Quizmaster
  in order to give out my Quiz
  I need to generate a code where Players can access the Quiz.

Background:
  Given there is a quiz called "Trivia"

Scenario: Viewing my quiz page
  Given I am on the quiz page for "Trivia"
  Then I should see "Trivia"
  And I should see a quiz code
