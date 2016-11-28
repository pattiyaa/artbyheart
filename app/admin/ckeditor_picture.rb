ActiveAdmin.register Ckeditor::Picture do
menu label: "Photos Browse"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params  :id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  render 'index'
end
controller do
	alias_method :batch_action_ckeditor_pictures, :batch_action
	def batch_action
		params[:collection_selection]=params[:collection_selection].select{|s| s!="0"}
		batch_action_ckeditor_pictures
	end
end

end
