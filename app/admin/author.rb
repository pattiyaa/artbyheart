ActiveAdmin.register Author do
 menu label: "Therapist"
 menu priority: 3, label: proc{ I18n.t("active_admin.therapist") }

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :avatarimg, :title,:subtitle,:profile, :login,projects_attributes: [:title,:description,:pictures, :_destroy, :id]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
# index do
# 	render 'index'
# end
# --------------------- Filter --------------------
filter :name
filter :title
filter :projects
filter :created_at
filter :updated_At
# ------------------ action item -----------------
action_item :project, only: [:show, :edit]  do
  link_to 'Add project', new_admin_author_project_path(:author_id=>params[:id]) 
end
# --------------- action --------------------------
after_create do
  addPicture
end
after_update do
  addPicture
end
before_destroy do
  @author.projects.each do |p|
    p.destroy
  end
end

controller do
  before_action :set_locale_en
  def addPicture
      if params[:author][:picture].present?
        $pic = Ckeditor::Picture.new(data: params[:author][:picture])
        @author.avatarimg = $pic
        @author.save
    end 
  end
  def removePicture
      if @author.avatarimg.present? 
          @author.avatarimg.destroy
      end
  end
end

# ------------------------ view --------------------

index as: :block  do |author|
  div for: author ,:class=>"row" do
    div :class=>"col-xs-12 col-sm-12 col-md-1" do
      resource_selection_cell author
    end
    div :class=>"col-xs-12 col-sm-12 col-md-4" do
      link_to image_tag(author.avatarimg.url ,:class=>"img-thumbnail"), admin_author_path(author) 

    end
    div :class=>"col-xs-12 col-sm-12 col-md-6" do
      link_to content_tag(:h4,author.name), admin_author_path(author) 
      div strong author.title
      div simple_format author.subtitle
    end
    div :class=>"col-xs-12 col-sm-12 col-md-1" do 
        span link_to( t(:edit), edit_admin_author_path(author))
        span link_to( t(:delete), admin_author_path(author), method: :delete, data: { confirm: t(:confirm_delete) })
      
    end
  end
end
show do
	render 'show'
end

form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :title
      f.input :subtitle
      f.input :profile, :as => :ckeditor,:class=>'fieldright',input_html: {:ckeditor => {height: '350px', :toolbar => 'mini'}}
          
      # f.input :avatarimg ,:image_preview => true,label: 'Avatar photo'
      f.input :picture ,:as =>"file",:image_preview => true,:image_selected => :avatarimg,label: 'Avatar photo'
      f.li do
        f.label 'Login user'
        f.collection_select :login, User.all, :id, :email ,{ include_blank: t(:msg_select) }
      end

    end
    # f.inputs "Projects" do
    #   f.has_many :projects,heading: 'Added project', allow_destroy: true do |project|
    #       project.input :title 
    #       project.input :description, :as => :ckeditor,:class=>'fieldright',input_html: {:ckeditor => {height: '200px', :toolbar => 'mini'}}
    #       project.input  :pictures, :as => :filesupload,:image_preview=> true 
    #   end
    # end
    f.submit label: 'Submit'
    render partial: '/layouts/modalholder'
end




end
