class CreatePlayerRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :player_rounds do |t|
      t.integer :total_score

      t.references :player
      t.references :round

      t.timestamps
    end
  end
end
