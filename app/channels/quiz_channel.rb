# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class QuizChannel < ApplicationCable::Channel
  def subscribed
    unless self.params[:data].nil?
      id = self.params[:data][:quiz_id]
    else
      id = self.connection.connection_identifier
    end
    stream_from "quiz_channel_#{id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def submit_answer(data)
    params = data['message'].symbolize_keys!
    question = Question.find(params[:question_id])
    if params[:team_id].nil?
      team = Team.find_by(name: params[:team_name], quiz: params[:quiz_id])
    else
      team = Team.find(params[:team_id])
    end
    Answer.create(body: params[:answer],
                  question: question,
                  team: team)
  end

  def get_quiz(code)
    quiz = Quiz.find_by(code: code['message'])
    ActionCable.server.broadcast "quiz_channel_", quiz
  end

  def create_team(data)
    Team.create(name: data['message']['team_name'], quiz_id: data['message']['quiz_id'])
  end
end
