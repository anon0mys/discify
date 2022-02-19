class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.integer :score

      t.references :player_round
      t.references :hole

      t.timestamps
    end
  end
end
