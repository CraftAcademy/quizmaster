class AddIsStartedToQuiz < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :is_started, :boolean, default: false
  end
end
