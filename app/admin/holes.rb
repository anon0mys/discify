ActiveAdmin.register Hole do
  belongs_to :layout
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :hole_number, :distance, :par, :layout_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:hole_number, :distance, :par, :layout_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
