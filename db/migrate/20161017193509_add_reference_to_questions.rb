class AddReferenceToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :quiz, foreign_key: true
  end
end
