class GamesController < ApplicationController
  before_action :get_quiz, only: [:show]

  def index
  end

  def show
    @team = Team.find(cookies['team_id']) unless cookies['team_id'].blank?
    render :show, locals:{message: "Welcome to quiz: #{@quiz.name}"}
  end

  def access_quiz
    quiz = Quiz.find_by(code: params[:code])
    redirect_to quiz_path(quiz)
  end

  def create_team
    team = Team.create(name: params[:team][:name], quiz_id: params[:team][:quiz_id])
    quiz = Quiz.find(params[:team][:quiz_id])
    cookies['team_id'] = team.id
    redirect_to quiz_path(quiz)
  end

  private
  def get_quiz
    @quiz = Quiz.find(params[:id])
  end

end
