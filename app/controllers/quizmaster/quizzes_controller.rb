class Quizmaster::QuizzesController < ApplicationController
  before_action :get_quiz, only: [:show, :start_quiz, :send_question]

  def show
    @questions = @quiz.questions
  end

  def start_quiz
    @questions = @quiz.questions
    content = params[:message]
    broadcast_content(content)
    render :show
  end

  def send_question
    question = Question.find(params[:question_id])
    content = {question: question.body}
    broadcast_content(content)
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
