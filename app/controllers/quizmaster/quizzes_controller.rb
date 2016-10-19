class Quizmaster::QuizzesController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end

  def broadcast_content
    # This method will broadcast content to Team
    # BroadcastQuizJob.perform_now('')
  end
end
