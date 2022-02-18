class CreateHoles < ActiveRecord::Migration[6.1]
  def change
    create_table :holes do |t|
      t.integer :hole_number
      t.integer :distance
      t.integer :par
      t.references :layout

      t.timestamps
    end
  end
end
