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
    team = Team.find(params[:team_id])
    Answer.create(body: params[:answer],
                  question: question,
                  team: team)
  end
end
