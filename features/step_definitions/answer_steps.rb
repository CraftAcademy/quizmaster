Given(/^"([^"]*)" has answered question "([^"]*)" with "([^"]*)"$/) do |team_name, question, answer|
  team = Team.find_by(name: team_name)
  question = Question.find_by(body: question)
  answer = Answer.create(team: team, question: question, body: answer)
end
