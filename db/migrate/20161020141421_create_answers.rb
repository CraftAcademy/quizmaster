class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :is_correct
      t.references :question, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
