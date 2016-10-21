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
  And there is a team named "Craft Academy" playing "Trivia"
  And there is a team named "Amber Rocks!" playing "Trivia"
  And I am on the quizmaster page for "Trivia"

Scenario: I correct the answers for a question
  Given I press the "Send" button for question "1"
  And "Craft Academy" has answered question "What is 2+2?" with "Six"
  And "Amber Rocks!" has answered question "What is 2+2?" with "4"
  When I click the "Correct" button
  Then I should be on the correction page for "What is 2+2?"
  When I click "right" on "4"
  And I click "incorrect" on "Six"
  Then "Amber Rocks!" should have "1" correct answer
