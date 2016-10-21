@action_cable @javascript
Feature: As a Quizmaster
  in order to mark correct Answers
  I need to see a list of Team Answers.

Background:
  Given there is a quiz called "Trivia"
  And the following questions exist in "Trivia":
    | body            | answer       |
    | What is 2+2?    | Four         |
    | Who is awesome? | Thomas is ok |
  And there is a team named "Craft Academy"
  And I am on the quizmaster page for "Trivia"

Scenario: I view the answers for a question
  Given I press the "Send" button for question "1"
  And "Craft Academy" has answered question "What is 2+2?" with "Six"
  When I click the "Correct" button
  Then I should be on the correction page for "What is 2+2?"
  And I should see "Six"
