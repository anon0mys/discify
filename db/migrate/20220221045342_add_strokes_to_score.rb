class AddStrokesToScore < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :strokes, :integer
  end
end
