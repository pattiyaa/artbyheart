ActiveAdmin.register Project do
	belongs_to :author
	navigation_menu :author
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :pictures,:author_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
before_create do
	# params[:project][:pictures].delete_at(0);
end

after_create do
	updatepicture
end
after_update do
	
	updatepicture
end
index as: :block ,:class =>"card-deck" do |project|
	div for: project ,:class =>"card" do
		div :class =>"card-header" do
			resource_selection_cell project
			h4 :class=>"card-title" do  auto_link  project.title end
			div simple_format project.description
			span :class =>"pull-right" do
				span do
					link_to("edit",  edit_admin_author_project_path(:author_id => project.author_id,:id => project.id)).html_safe
				end
				span do
					link_to("delete", admin_author_project_path(:author_id => project.author_id,:id => project.id),method: :delete, data: { confirm: 'Are you sure?' }).html_safe
				end
			end
		end
	
		span gallery_for(project.pictures.map{|p| p.url}, "project_gallery").html_safe
		 
	end
end
controller do
	def updatepicture

		@pics=[]
		params[:project][:pictures].each do |pic|
			begin
				if eval(pic)[:id].present?
					@pics.push(Ckeditor::Picture.find(eval(pic)[:id]))
				end
			rescue
				@pics.push(Ckeditor::Picture.new(data: pic))
			end
		end
		@project.pictures =@pics 
		@project.save
	end
end

form do |f|
	f.inputs 'Details' do
		f.input :title
		f.input :description, :as => :ckeditor,input_html: {:ckeditor => {height: '200px', :toolbar => 'mini'}}
		f.li do
			f.label 'Author'
			f.collection_select :author_id, Author.all, :id, :name, { include_blank: 'Select one' }
		end
    	# f.file_field :pictures,:multiple => true
    	f.input  :pictures, :as => :filesupload,:image_preview=> true

    end
    f.submit
end

def has_pictures?
	params[:project][:pictures].present?
end
def uploadpictures
	params[:project][:pictures].first()
end
end
