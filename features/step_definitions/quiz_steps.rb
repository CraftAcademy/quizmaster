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
  steps %q{
    Given there is a "team_id" cookie set to "Craft Academy"
    When I am on the quiz page for "Trivia"
    And I switch to a new window
    And I am on the quizmaster page for "Trivia"
    When I press the "Send" button for question "What is 2+2?"
    And I switch to window "1"
  }
end

Then(/^there should be "([^"]*)" answer for the "([^"]*)" team$/) do |count, team_name|
  sleep(2)
  team = Team.find_by(name: team_name)
  expect(team.answers.count).to eq count.to_i
  sleep(2)
end

Given(/^"([^"]*)" have the following quiz$/) do |email, table|
    user = User.find_by(email: email)
    table.hashes.each do |quiz|
    FactoryGirl.create(:quiz, name: quiz[:name], user: user)
  end
end
