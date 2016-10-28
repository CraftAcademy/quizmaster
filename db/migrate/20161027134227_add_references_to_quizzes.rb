class AddReferencesToQuizzes < ActiveRecord::Migration[5.0]
  def change
    add_reference :quizzes, :user, foreign_key: true
  end
end
