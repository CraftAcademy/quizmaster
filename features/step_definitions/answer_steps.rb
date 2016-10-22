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
  expect(team.answers.where(is_correct: true).count).to eq count.to_i
  # I realize you don't have expectations in Given steps - if this is here it's because I forgot to take it out at the end of the feature.
end
