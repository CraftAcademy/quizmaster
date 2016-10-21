When(/^I press the "([^"]*)" button for question "([^"]*)"$/) do |button, position|
  index = position.to_i - 1
  within("#question#{index}") { click_link_or_button button }
end

Then(/^I should be on the correction page for "([^"]*)"$/) do |question|
  question = Question.find_by(body: question)
  expect(current_path).to eq "/quizmaster/quiz/answers/#{question.id}"
end
