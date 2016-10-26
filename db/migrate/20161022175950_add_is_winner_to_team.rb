class AddIsWinnerToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :is_winner, :boolean, default: false
  end
end
