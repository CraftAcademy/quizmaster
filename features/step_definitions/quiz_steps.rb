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


Given(/^I open a new window$/) do
  open_new_window
end


And(/^I am on the quiz page for "([^"]*)" within window "([^"]*)"$/) do |quiz_name, window|
  index = window.to_i - 1
  quiz = Quiz.find_by(name: quiz_name)
  within_window(switch_to_window(windows[index])) do
    visit quizmaster_quiz_path(quiz)
    save_screenshot("#{index}.png")
  end
end

Then(/^I should have "([^"]*)" active windows$/) do |count|
  expect(windows.count).to eq count.to_i
end