class Quizmaster::QuizzesController < ApplicationController
  before_action :get_quiz, only: [:show, :start_quiz]

  def show
    @questions = @quiz.questions
  end

  def start_quiz
    # @quiz = Quiz.find(params[:format])
    @questions = @quiz.questions
    content = params[:message]
    broadcast_content(content)
    render :show
  end

  def broadcast_content(content)
    # This method will broadcast content to Team
    BroadcastQuizJob.perform_now(content)
  end

  private

  def get_quiz
    @quiz = Quiz.find(params[:id])
  end
end
