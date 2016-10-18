class GamesController < ApplicationController
  def index

  end

  def show
    @quiz = Quiz.find(params[:id])
    message = "Welcome to quiz: #{@quiz.name}"
    ActionCable.server.broadcast 'quiz_channel',
                                 message: message
    #head :ok
  end

  def access_quiz
    quiz = Quiz.find_by(code: params[:code])
    redirect_to quiz_path(quiz)
  end

end
