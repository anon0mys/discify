desc 'Set the active flag on the Layout data'
task set_active_layouts: :environment do
  Layout.update_all(active: true)
  layout_ids = Hole.where(par: 0).pluck(:layout_id)
  Layout.where(id: layout_ids).update_all(active: false)
end