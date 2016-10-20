Given(/^there is a quiz called "([^"]*)"$/) do |name|
  FactoryGirl.create(:quiz, name: name)
end

Given(/^I am on the quizmaster page for "([^"]*)"$/) do |quiz_name|
  @quiz = Quiz.find_by(name: quiz_name)
  visit quizmaster_quiz_path(@quiz)
end

Then(/^I should see a quiz code$/) do
  expect(page).to have_content @quiz.code
end

Given(/^I receive the first question$/) do
  steps %Q{
    Given there is a "team_id" cookie set to "Craft Academy"
    When I am on the quiz page for "Trivia"
    And I switch to a new window
    And I am on the quizmaster page for "Trivia"
    When I press the "Send" button for question "1"
    And I switch to window "1"
  }
end
