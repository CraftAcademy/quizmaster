class AddIsSentToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :is_sent, :boolean, default: false
  end
end
