Rails.application.routes.draw do
  namespace :quizmaster do
    resources :quiz, controller: :quizzes, only: [:show]
  end
end
