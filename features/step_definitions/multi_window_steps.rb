Given(/^I switch to a new window$/) do
  window = open_new_window
  switch_to_window(window)
end

Given(/^I switch to window "([^"]*)"$/) do |index|
  switch_to_window(windows[index.to_i - 1])
  sleep(2)
end

Then(/^I should have "([^"]*)" active windows$/) do |count|
  expect(windows.count).to eq count.to_i
end

Given(/^I am on the quiz page for "([^"]*)" in window "([^"]*)"$/) do |quiz, index|
  quiz = Quiz.find_by(name: quiz)
  switch_to_window(windows[index.to_i - 1])
  visit quiz_path(quiz)
  expect(page).to have_content quiz.name
end

Then(/^I should see my text "([^"]*)"$/) do |text|
  field = find_field('team[name]')
  expect(field.value).to eq text
end

# Then(/^I should see "([^"]*)" within window "([^"]*)"$/) do |content, index|
#   expect(windows[index.to_i - 1]).to have_content content
# end
