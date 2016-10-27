Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^I should not see "([^"]*)"$/) do |content|
  expect(page).not_to have_content content
end

Then(/^show me the page$/) do
  save_and_open_page
end

When(/^I enter "([^"]*)"$/) do |text|
  fill_in 'team_name', with: text
end

Given(/^I am on the page for "([^"]*)"$/) do |name|
  quiz = Quiz.find_by(name: name)
  visit quiz_path(quiz)
end

Given(/^I am on the landing page for quizmaster$/) do
  visit root_path
end

Then(/^I should be on the Log in page$/) do
  expect(current_path).to eq new_user_session_path
end


When(/^I (?:press|click) the "([^"]*)" (?:button|link)$/) do |button|
  click_link_or_button button
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, content|
  fill_in element, with: content
end

When(/^I wait for the page to load$/) do
  sleep(1)
end
