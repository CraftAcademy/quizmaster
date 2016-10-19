class Quizmaster::QuizzesController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end

  def broadcast_content
    BroadcastQuizJob.perform_now('Whatup??')
  end
end
