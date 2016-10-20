@javascript @action_cable
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
  Then I should see "Welcome to quiz: Trivia"


Scenario: Starting the quiz
  And I switch to a new window
  And I am on the quizmaster page for "Trivia"
  When I fill in "message" with "The Quiz begins!"
  And I click the "Start the Quiz" button
  And I switch to window "1"
  Then I should see "The Quiz begins!"
