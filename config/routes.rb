Rails.application.routes.draw do
  get '/quizmaster', controller: :quizzes, action: :index
end
