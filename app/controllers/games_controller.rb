class GamesController < ApplicationController
  before_action :get_quiz, only: [:show]

  def index
  end

  def show
    @team = Team.find(cookies['team_id']) unless cookies['team_id'].nil?
    render :show, locals: {message: "Welcome to quiz: #{@quiz.name}"}
  end

  def access_quiz
    quiz = Quiz.find_by(code: params[:code])
    redirect_to quiz_path(quiz)
  end

  def create_team
    team = Team.create(name: params[:team][:name], quiz_id: params[:quiz_id])
    quiz = Quiz.find(params[:quiz_id])
    cookies['team_id'] = team.id
    redirect_to quiz_path(quiz)
  end

  def send_answer
    question = Question.find(params[:question_id])
    team = Team.find(params[:team_id])
    @answer = Answer.create(body: params[:body], question: question, team: team)
    BroadcastMessageJob.perform_now({message: 'Answer submitted!', welcome: 'true'})
    head :ok
  end

  private
  def get_quiz
    @quiz = Quiz.find(params[:id])
  end

end
