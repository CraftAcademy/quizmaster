Rails.application.routes.draw do

  namespace :quizmaster do
    resources :quiz, controller: :quizzes, only: [:show]
    post '/quiz/:id', controller: :quizzes, action: :start_quiz
    post '/send_question', controller: :quizzes, action: :send_question
    get 'quiz/answers/:id', controller: :quizzes, action: :correct_answers
    post 'quiz/answers/:id', controller: :quizzes, action: :mark_answers
  end

  resources :quiz, controller: :games, only: [:index, :show] do
    post '/create_team', controller: :games, action: :create_team
  end

  post 'access_quiz' , controller: :games, action: :access_quiz, as: :access_quiz

  mount ActionCable.server => '/cable'

  root 'games#index'
end
