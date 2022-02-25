class AddActiveToLayouts < ActiveRecord::Migration[6.1]
  def change
    add_column :layouts, :active, :boolean
  end
end
