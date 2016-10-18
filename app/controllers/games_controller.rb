class GamesController < ApplicationController
  before_action :get_quiz, only: [:show]

  def index
  end

  def show
    render :show, locals:{message: "Welcome to quiz: #{@quiz.name}"}
  end

  def access_quiz
    quiz = Quiz.find_by(code: params[:code])
    redirect_to quiz_path(quiz)
  end

  private
  def get_quiz
    @quiz = Quiz.find(params[:id])
  end

end
