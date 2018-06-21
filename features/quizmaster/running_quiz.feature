@javascript @action_cable
Feature: Quizmaster runs quiz 
  As a Quizmaster
  in order to show individual Questions
  I need to be able to push Questions one by one to the Question page.

Background:
  Given there is a quiz called "Trivia"
  And the following questions exist in "Trivia":
    | body            | answer       |
    | What is 2+2?    | Four         |
    | Who is awesome? | Thomas is ok |
  And there is a team named "Craft Academy" playing "Trivia"
  And I am on the quizmaster page for "Trivia"

Scenario: I send the first question
  Given there is a "team_id" cookie set to "Craft Academy"
  When I am on the quiz page for "Trivia"
  And I switch to a new window
  And I am on the quizmaster page for "Trivia"
  When I press the "Send" button for question "What is 2+2?"
  And I switch to window "1"
  Then I should see "What is 2+2?"

Scenario: I send multiple questions
  Given I have sent the first question
  And I click the "Correct" button
  When I click the "Back to Questions" link
  And I wait for the page to load
  And I should see "Correct"

Scenario: Resetting the quiz
  Given I have sent the first question
  And "Craft Academy" has answered question "What is 2+2?" with "Six"
  When I press the "Reset the Quiz" button
  And I accept the alert
  Then I should not see "Correct"
  And there should be 0 answers for "What is 2+2?"
