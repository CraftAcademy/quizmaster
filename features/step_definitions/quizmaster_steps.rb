When(/^I press the "([^"]*)" button for question "([^"]*)"$/) do |button, position|
  index = position.to_i - 1
  within("#question#{index}") { click_link_or_button button }
end

Then(/^I should be on the correction page for "([^"]*)"$/) do |question|
  question = Question.find_by(body: question)
  expect(current_path).to eq "/quizmaster/quiz/answers/#{question.id}"
end

When(/^I click "([^"]*)" on "([^"]*)"$/) do |is_correct, answer|
  question = Answer.find_by(body: answer).question
  question.answers.each_with_index do |response, index|
    if response == answer
      position = index
    end
  end
  within("answer#{position}") { click_link_or_button is_correct }
end

Then(/^"([^"]*)" should have "([^"]*)" correct answer$/) do |team_name, count|
  team = Team.find_by(name: team_name)
  expect(team.answers.count.where(is_correct: true)).to eq count
end
