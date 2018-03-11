Given(/^I am on the quiz "([^"]*)" page$/) do |page|
  case page
  when 'landing'
    visit quiz_index_path
  end
end

And(/^I enter the code for "([^"]*)"$/) do |quiz|
  quiz = Quiz.find_by(name: quiz)
  fill_in :code, with: quiz.code
  click_link_or_button 'Submit'
end

Given(/^I enter a bad code$/) do
  fill_in :code, with: 'nonsense'
  click_link_or_button 'Submit'
end

Then(/^I should be on the quiz page for "([^"]*)"$/) do |quiz|
  quiz = Quiz.find_by(name: quiz)
  expect(current_path).to eq quiz_path(quiz)
end

Then(/^I am on the quiz page for "([^"]*)"$/) do |quiz|
  quiz = Quiz.find_by(name: quiz)
  visit quiz_path(quiz)
end

And(/^I should see a Create Team form$/) do
  expect(page).to have_css('form#create_team')
end

Given /^there is a "([^\"]+)" cookie set to "([^\"]+)"$/ do |key, value|
  team = Team.find_by(name: value)
  team_id = team.id.to_s
  quiz_id = team.quiz.id.to_s

  page.driver.browser.manage.add_cookie(name: key, value: team_id)
  page.driver.browser.manage.add_cookie(name: 'quiz_id', value: quiz_id)
end

And(/^there is a team named "([^"]*)" playing "([^"]*)"$/) do |team_name, quiz_name|
  quiz = Quiz.find_by(name: quiz_name)
  create(:team, name: team_name, quiz: quiz)
end

When(/^"([^"]*)" is looking at the quiz page for "([^"]*)"$/) do |team_name, quiz_name|
    steps %Q{
      Given there is a "team_id" cookie set to "#{team_name}"
      And I switch to a new window
      And I am on the quiz page for "#{quiz_name}"
      And I switch to window "1"
    }
end

Then(/^window (\d+) should see "([^"]*)"$/) do |window, content|
  steps %Q{
    Given I switch to window "#{window.to_i}"
  }
  sleep 1
  expect(page).to have_content content
end

Then(/^window (\d+) should not see "([^"]*)"$/) do |window, content|
  steps %Q{
    Given I switch to window "#{window.to_i}"
  }
  sleep 1
  expect(page).not_to have_content content
end
