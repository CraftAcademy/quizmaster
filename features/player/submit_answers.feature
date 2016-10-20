@javascript @action_cable
Feature: As a Team
  in order to participate in the game
  I need to be able to submit Answers.

Background:
  Given there is a quiz called "Trivia"
  And the following questions exist in "Trivia":
    | body            | answer       |
    | What is 2+2?    | Four         |
    | Who is awesome? | Thomas is ok |
  And there is a team named "Craft Academy"

Scenario: I submit my answer
  Given I receive the first question
  When I fill in "answer" with "Four"
  And click the "Submit" button
  Then I should see "Answer submitted!"
