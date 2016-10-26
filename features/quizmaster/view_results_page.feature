@action_cable @javascript
Feature: As a Quizmaster
  in order to declare a winner
  I need to see a tally of Teams' correct Answers.

Background:
  Given there is a quiz called "Trivia"
  And there is a team named "Craft Academy" playing "Trivia"
  And there is a team named "Amber Rocks" playing "Trivia"
  And "Craft Academy" has answered "10" questions right
  And "Amber Rocks" has answered "11" questions right

Scenario: I view and send results
  And I am on the quizmaster page for "Trivia"
  When I click the "Results" button
  Then I should see "10"
  When "Amber Rocks" is looking at the quiz page for "Trivia"
  And I click the "Send Results" button
  Then window 2 should see "Amber Rocks got 11 points Craft Academy got 10 points"
