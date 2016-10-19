Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^show me the page$/) do
  save_and_open_page
end

When(/^I click the "([^"]*)" button$/) do |button|
  click_link_or_button button
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, content|
  fill_in element, with: content
end
