# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: 'qm@quizmaster.com', password: 'password')

quiz1 = Quiz.create(name: "Quiz One", user: user)
quiz2 = Quiz.create(name: "Quiz Two", user: user)

question1 = 'What is the tastiest food ever?'
answer1 = 'French Fries'
question2 = 'Do blondes really have more fun?'
answer2 = 'Jajamen'
question3 = 'Is chocolate better than sex?'
answer3 = 'Depends who you are having sex with'
question4 = 'Will it rain tomorrow?'
answer4 = 'Yes, always.'
question5 = 'Is it ever warm in Gothenburg?'
answer5 = 'No'

Question.create(body: question1, answer: answer1, quiz: quiz1)
Question.create(body: question2, answer: answer2, quiz: quiz1)
Question.create(body: question3, answer: answer3, quiz: quiz2)
Question.create(body: question4, answer: answer4, quiz: quiz2)
Question.create(body: question5, answer: answer5, quiz: quiz2)

Team.create(name: 'team1', quiz: quiz1)
Team.create(name: 'team2', quiz: quiz1)
Team.create(name: 'team3', quiz: quiz1)
Team.create(name: 'team4', quiz: quiz1)
Team.create(name: 'team5', quiz: quiz1)
