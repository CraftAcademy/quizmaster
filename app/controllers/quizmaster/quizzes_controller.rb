class Quizmaster::QuizzesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  before_action :get_quiz, except: [:correct_answers,
                                    :broadcast_content,
                                    :mark_answers,
                                    :get_winner_message,
                                    :index,
                                    :new,
                                    :create]
                                    # :add_questions]

  def show
    @questions = @quiz.questions.sort
  end

  def index
    redirect_to root_path unless current_user
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizzes.create(quiz_params)
    if @quiz.save
      questions_params[:questions].each do |question|
        @quiz.questions.create(question)
      end
      binding.pry

      render :new
    else
      flash[:alert] = @quiz.errors.full_messages.first
      render :new
    end
  end

  # def add_questions
  #   @question = Question.new
  # end

  def start_quiz
    content = {message: params[:message], welcome: params[:welcome], quiz_id: params[:id]}
    BroadcastMessageJob.perform_now(content)
    @quiz.update_attribute(:is_started, true)
  end

  def send_question
    question = Question.find(params[:question_id])
    content = {question: question.body, index: params[:index], quiz_id: params[:id], question_id: params[:question_id]}
    broadcast_content(content)
    question.update_attribute(:is_sent, true)
  end

  def send_results
    list = @quiz.get_scores
    content = {winner: get_winner, list: list, welcome: 'false', quiz: @quiz}
    BroadcastWinnerJob.perform_now(content)
    head :ok
  end

  def reset_quiz
    @quiz.reset_quiz_actions
    @questions = @quiz.questions.sort
    render :show
  end

  def correct_answers
    @question = Question.find(params[:id])
    render :answers
  end

  def broadcast_content(content)
    # This method will broadcast content to Team
    BroadcastQuizJob.perform_now(content)
  end


  def mark_answers
    answer = Answer.find(params[:id])
    if params[:correct] == 'true'
      answer.update_attribute(:is_correct, true)
    elsif params[:correct] == 'false'
      answer.update_attribute(:is_correct, false)
    end
    head :ok
  end

  def results
  end

  private

  def get_quiz
    @quiz = Quiz.find(params[:id])
  end

  def get_winner
    winner = Team.find_by(name: @quiz.get_scores.last[:team].name)
    winner.update_attribute(:is_winner, true)
    winner
  end

  def quiz_params
    params.permit(:name)
  end

  def questions_params
    params.permit(questions: [:body, :answer])
  end
end
