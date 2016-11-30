ActiveAdmin.register Author do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :avatarimg, :title, :login
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
show do
	render 'show'
end


after_create do
  
  saveimg = Ckeditor::picture_model.new( data_file_name: uploaded_url, data_content_type:  uploaded_type, assetable_id: 1, assetable_type: 'User', type: 'Ckeditor::Picture')
  saveimg.save
end
controller do
  alias_method :update_post, :update
  def update
    # before update
    if change_img?
      # get current image from ckeditor asset
      ckeditorImg = Ckeditor::picture_model.find_by data_file_name:  current_img_url
    end

    update_post

    # after update
    if ckeditorImg.present?
      ckeditorImg.data_file_name = uploaded_url
      ckeditorImg.save
    else
      saveimg = Ckeditor::picture_model.new( data_file_name: uploaded_url, data_content_type:  uploaded_type, assetable_id: 1, assetable_type: 'User', type: 'Ckeditor::Picture')
      saveimg.save
    end
  
  end

  alias_method :destroy_post, :destroy
  def destroy
    # before destroy
    ckeditorImg = Ckeditor::picture_model.find_by data_file_name:  current_img_url
    if ckeditorImg.present?
       ckeditorImg.delete
       ckeditorImg.save
    end
    destroy_post
    # after destroy
  end

  private 
  def obj
    params[:author]
  end
  def change_img?
    obj[:avatarimg].present?
  end
  def current_img_url
     Author.find(params[:id]).avatarimg.file.identifier
  end
  def uploaded_url
     @author.avatarimg.file.identifier
  end
  def uploaded_type
     @author.avatarimg.file.resource_type
  end
end

form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :title
      f.input :avatarimg ,:image_preview => true,label: 'Avatar photo'
      f.li do
        f.label 'Login user'
        f.collection_select :login, User.all, :id, :email 
      end
    end
     f.submit lable: 'Submit'
end



end
