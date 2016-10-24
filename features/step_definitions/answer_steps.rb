Given(/^"([^"]*)" has answered question "([^"]*)" with "([^"]*)"$/) do |team_name, question, answer|
  team = Team.find_by(name: team_name)
  question = Question.find_by(body: question)
  answer = FactoryGirl.create(:answer, team: team, question: question, body: answer)
end

Given(/^"([^"]*)" has answered "([^"]*)" questions right$/) do |team_name, count|
  team = Team.find_by(name: team_name)
  count.to_i.times do
    FactoryGirl.create(:answer, team: team, is_correct: true)
  end
end

Then(/^there should be (\d+) answers for "([^"]*)"$/) do |count, question_body|
  question = Question.find_by(body: question_body)
  expect(question.answers.count).to eq count.to_i
end
