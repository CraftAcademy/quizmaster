@javascript @action_cable
Feature: As a Quizmaster
  in order to show individual Questions
  I need to be able to push Questions one by one to the Question page.

Background:
  Given there is a quiz called "Trivia"
  And the following questions exist in "Trivia":
    | body            | answer       |
    | What is 2+2?    | Four         |
    | Who is awesome? | Thomas is ok |
  And I am on the quizmaster page for "Trivia"

Scenario: I send the first question
  When I am on the quiz page for "Trivia"
  And I switch to a new window
  And I am on the quizmaster page for "Trivia"
  When I press the "Send to Teams" button for question "1"
  And I switch to window "1"
  Then I should see "What is 2+2?"
