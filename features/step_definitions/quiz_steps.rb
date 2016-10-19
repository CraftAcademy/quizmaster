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
  @window_1 = windows.first
  @window_2 = windows.last
end


Then(/^I should have "([^"]*)" active windows$/) do |count|
  puts @window_1.session.body
  puts @window_2.session.body
  expect(windows.count).to eq count.to_i
end

And(/^I am on the quiz page for "([^"]*)" within window "([^"]*)"$/) do |name, window|
  index = window.to_i - 1
  within_window windows[index] do
    visit '/quiz'
    # steps %Q{
    #     Given I am on the quiz page for "#{name}"
    #       }
  end
  puts windows[index].session.body
end