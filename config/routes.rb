Rails.application.routes.draw do

  namespace :quizmaster do
    resources :quiz, controller: :quizzes, only: [:show]
  end

  resources :quiz, controller: :games, only: [:index, :show] do
  end

  post 'access_quiz' , controller: :games, action: :access_quiz, as: :access_quiz

  mount ActionCable.server => '/cable'

  root 'quiz#index'
end
