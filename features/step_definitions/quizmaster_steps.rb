When(/^I press the "([^"]*)" button for question "([^"]*)"$/) do |button, question|
  question = Question.find_by(body: question)
  within("#question#{question.id}") { click_link_or_button button }
end

When(/^I press the correct button for question "([^"]*)"$/) do |question|
  question = Question.find_by(body: question)
  find("#correct_button_#{question.id}").trigger('click')
end

Then(/^I should be on the correction page for "([^"]*)"$/) do |question|
  question = Question.find_by(body: question)
  expect(current_path).to eq "/quizmaster/quiz/answers/#{question.id}"
end

Then(/^I should be on the quizmaster page for "([^"]*)"$/) do |quiz|
  quiz = Quiz.find_by(name: quiz)
  expect(current_path).to eq quizmaster_quiz_path(quiz)
end

When(/^I click "([^"]*)" on "([^"]*)"$/) do |is_correct, answer|
  question = Answer.find_by(body: answer).question
  question.answers.each do |response|
    if response.body == answer
      within("#answer_#{response.id}") { find("##{is_correct}").trigger('click') }
    end
  end
end

Then(/^"([^"]*)" should have "([^"]*)" correct (?:answer|answers)$/) do |team_name, count|
  team = Team.find_by(name: team_name)
  expect(team.answers.where(is_correct: true).count).to eq count.to_i
end

Given(/^I have sent the first question$/) do
  steps %{
    Given I am on the quizmaster page for "Trivia"
    And I press the "Send" button for question "What is 2+2?"
  }
end

Given(/^there is a quizmaster with email "([^"]*)"$/) do |email|
  FactoryGirl.create(:user, email: email)
end

Given(/^I log in as "([^"]*)"$/) do |email|
  steps %Q{
    Given I am on the quizmaster "Log in" page
    Then I fill in "Email" with "#{email}"
    And I fill in "Password" with "password"
    And I click the "Log in" button
  }
end


Given(/^I am on the quizmaster "([^"]*)" page$/) do |page|
  case page
  when 'Sign up'
    visit new_user_registration_path
  when 'Log in'
    visit new_user_session_path
  when 'Dashboard'
    visit quizmaster_dashboard_path
  end
end
