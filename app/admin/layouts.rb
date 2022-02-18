ActiveAdmin.register Layout do
  belongs_to :course
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :total_par, :total_distance, :course_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :total_par, :total_distance, :course_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  show do
    attributes_table do
      row :name
      row :description
      row :total_par
      row :total_distance
    end

    panel "Holes" do
      table_for resource.holes do
        column :hole_number
        column :distance
        column :par
      end
    end
  end
end
