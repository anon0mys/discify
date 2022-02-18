class CreateLayouts < ActiveRecord::Migration[6.1]
  def change
    create_table :layouts do |t|
      t.string :name
      t.string :description
      t.integer :total_par
      t.integer :total_distance
      t.references :course

      t.timestamps
    end
  end
end
