Given(/^I am on the quiz page$/) do
  visit '/quizmaster'
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end
