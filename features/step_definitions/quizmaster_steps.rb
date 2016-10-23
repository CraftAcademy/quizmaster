When(/^I press the "([^"]*)" button for question "([^"]*)"$/) do |button, question|
  question = Question.find_by(body: question)
  within("#question#{question.id}") { click_link_or_button button }
end

When(/^I press the correct button for question "([^"]*)"$/) do |question|
  question = Question.find_by(body: question)
  find("#correct_button_#{question.id}").trigger('click')
  # click_link_or_button "#correct_button_#{question.id}"
  # within("#question#{question.id}") { click_link_or_button button }
end

Then(/^I should be on the correction page for "([^"]*)"$/) do |question|
  question = Question.find_by(body: question)
  expect(current_path).to eq "/quizmaster/quiz/answers/#{question.id}"
end

Then(/^I should be on the quizmaster page for "([^"]*)"$/) do |quiz|
  quiz = Quiz.find_by(name: quiz)
  expect(current_path).to eq quizmaster_quiz_path(quiz)
end

When(/^I click "([^"]*)" on "([^"]*)"$/) do |is_correct, answer|
  question = Answer.find_by(body: answer).question
  question.answers.each do |response|
    if response.body == answer
      within("#answer_#{response.id}") { find("##{is_correct}").trigger('click') }
    end
  end
end

Then(/^"([^"]*)" should have "([^"]*)" correct (?:answer|answers)$/) do |team_name, count|
  team = Team.find_by(name: team_name)
  expect(team.answers.where(is_correct: true).count).to eq count.to_i
end
