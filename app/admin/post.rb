ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title,:subtitle, :post_category_id,:author_id,:isHighlight,:isToplist,:active,:cover_img,:published_date,:content,tag_ids: [:id]
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
  alias_method :new_post, :new
  def new
    new_post
    
  end
  alias_method :update_post, :update
  def update
    # before update
    if change_img?
      # get current image from ckeditor asset
    ckeditorImg = Ckeditor::picture_model.find_by data_file_name:  current_img_url
    end
    
    update_post
    # update tags
    @post.tags << Tag.where(:id => params[:post][:tag_ids])
    
    # after update
    if change_img?
      if ckeditorImg.present?
        ckeditorImg.data_file_name = uploaded_url
        ckeditorImg.save
      else
        
         saveimg = Ckeditor::picture_model.new( data_file_name: uploaded_url, data_content_type:  uploaded_type, assetable_id: 1, assetable_type: 'User', type: 'Ckeditor::Picture')
         saveimg.save
      end
    end 
  end

  alias_method :destroy_post, :destroy
  def destroy
    # before destroys
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
    params[:post]
  end
  def change_img?
    obj[:cover_img].present?
  end
  def current_img_url
     if Post.find(params[:id]).cover_img.present?
        Post.find(params[:id]).cover_img.file.identifier
     end
  end
  def uploaded_url
     @post.cover_img.file.identifier
  end
  def uploaded_type
     @post.cover_img.file.resource_type
  end
end

form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :subtitle
      f.li do
        f.label 'Category'
        f.collection_select :post_category_id, PostCategory.all, :id, :name, { include_blank: 'Create new' }
      end
      
      f.li do
        f.label 'Author'
        f.collection_select :author_id, Author.all, :id, :name, { include_blank: 'Create new' }
      end
      f.input :tags, as: :check_boxes, :collection => Tag.all
      f.a link_to 'New tag',new_tag_path ,data: { modal: true},:redirectturl=> edit_admin_post_path(params[:id])
      f.input :isHighlight , label: 'Show as highlight topic'
      f.input :isToplist, label: 'Show in top 10 list'
      f.input :active, label: 'Active'
      f.input :cover_img ,:image_preview => true,label: 'Cover photo'
      
      f.li do
        f.label 'Publish Post At'
        f.date_field :published_date
      end
    end
    
    f.input :content, label: 'Content', :as => :ckeditor, input_html: {:ckeditor => {height: 550, :toolbar => 'FULL'}}, class: "form-control"
    f.submit lable: 'Submit'
    render partial: '/layouts/modalholder'
end

end
