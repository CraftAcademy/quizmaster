class BroadcastQuizJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast 'quiz_channel', create_partial(data)
  end

  def create_partial(data)
    # @answer = Answer.new(quiz_id: data.quiz_id, question_id: data.question_id)
    @quiz = Quiz.find(data[:quiz_id])
    ApplicationController.renderer.render(partial: './partials/question', locals: {data: data})
  end
end

