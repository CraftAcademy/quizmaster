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
  And "Amber Rocks!" has answered question "What is 2+2?" with "4"
  And "Craft Academy" has answered question "What is 2+2?" with "Six"
  When I click the "Correct" button
  Then I should be on the correction page for "What is 2+2?"
  When I click "right" on "4"
  And I click "wrong" on "Six"
  Then "Amber Rocks!" should have "1" correct answer
  And "Craft Academy" should have "0" correct answers
  When I click "undo" on "Six"
  And I click "right" on "Six"
  Then show me the page
  Then "Craft Academy" should have "1" correct answers
