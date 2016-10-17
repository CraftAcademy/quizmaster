Feature: As a Quizmaster
  in order to give out my Quiz
  I need to generate a code where Players can access the Quiz.

Scenario: Viewing my quiz page
Given I am on the quiz page
Then I should see "Trivia"
And I should see "1234"
