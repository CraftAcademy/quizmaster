Feature: As a Quizmaster
  in order to give out my Quiz
  I need to generate a code where Players can access the Quiz.

Background:
  Given there is a quiz called "Trivia"
  And the following questions exist in "Trivia":
  | body            | answer     |
  | What is 2+2?    | Four       |
  | Who is awesome? | Not Thomas |
  And I am on the quiz page for "Trivia"

Scenario: Viewing my quiz page
  Then I should see "Trivia"
  And I should see a quiz code
  And I should see "Who is awesome?"

@javascript
Scenario: Starting the quiz
  When I click the "Start the Quiz" button
  # Then I should send a message to Teams
