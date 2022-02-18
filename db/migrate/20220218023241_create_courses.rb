class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :state
      t.string :location
      t.float :rating
      t.integer :holes
      t.string :availability
      t.string :tees
      t.string :targets
      t.string :property
      t.string :services
      t.string :established

      t.timestamps
    end
  end
end


