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

Then(/^I should be on the quiz page for "([^"]*)"$/) do |quiz|
  quiz = Quiz.find_by(name: quiz)
  expect(current_path).to eq quiz_path(quiz)
end