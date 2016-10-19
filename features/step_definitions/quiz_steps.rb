Given(/^there is a quiz called "([^"]*)"$/) do |name|
  FactoryGirl.create(:quiz, name: name)
end

Given(/^I am on the quiz page for "([^"]*)"$/) do |quiz_name|
  @quiz = Quiz.find_by(name: quiz_name)
  visit quizmaster_quiz_path(@quiz)
end

Then(/^I should see a quiz code$/) do
  expect(page).to have_content @quiz.code
end

Given(/^I switch to a new window$/) do
  window = open_new_window
  switch_to_window(window)
end

Given(/^I switch to window "([^"]*)"$/) do |index|
  switch_to_window(windows[index.to_i - 1])
end

Then(/^I should have "([^"]*)" active windows$/) do |count|
  expect(windows.count).to eq count.to_i
end