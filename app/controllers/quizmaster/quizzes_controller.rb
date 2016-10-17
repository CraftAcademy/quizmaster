class Quizmaster::QuizzesController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end
end
