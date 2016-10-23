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
  Given I press the "Send" button for question "What is 2+2?"
  And "Amber Rocks!" has answered question "What is 2+2?" with "4"
  And "Craft Academy" has answered question "What is 2+2?" with "Six"
  When I press the correct button for question "What is 2+2?"
  Then I should be on the correction page for "What is 2+2?"
  When I click "right" on "4"
  And I click "wrong" on "Six"
  Then "Amber Rocks!" should have "1" correct answer
  And "Craft Academy" should have "0" correct answers
  And I should see "Undo?"

Scenario: The back button takes me back to my Quiz
  Given I press the "Send" button for question "What is 2+2?"
  And I click the "Correct" button
  When I click the "Back to Questions" button
  Then I should be on the quizmaster page for "Trivia"
