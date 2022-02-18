ActiveAdmin.register Course do

  index do
    selectable_column
    id_column
    column :name
    column :city
    column :state
    column :rating
    column :holes
    column :availability
    column :tees
    column :targets
    column :property
    column :services
    column :established
  end

  show do
    attributes_table do
      row :name
      row :description
      row :city
      row :state
      row :rating
      row :holes
      row :availability
      row :tees
      row :targets
      row :property
      row :services
      row :established
    end

    panel "Layouts" do
      table_for course.layouts do
        column do |layout|
          link_to 'View Layout', admin_course_layout_path(course.id, layout)
        end
        column :name
        column :description
        column :total_par
        column :total_distance
        
      end
    end
  end

  permit_params :name, :description, :city, :state, :rating, :holes, :availability, :tees, :targets, :property, :services, :established

  filter :name
  filter :city
  filter :holes
  filter :rating
end
