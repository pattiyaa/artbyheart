ActiveAdmin.register Post do
menu priority: 2, label: proc{ I18n.t("active_admin.post") }

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title,:subtitle, :post_category_id,:author_id,:isHighlight,:isToplist,:active,:picture,:cover_img,:published_date,:content,:tag_ids,tags_attributes:[:id,:name],pictures:[:id]
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

# --------------- action --------------------------
after_create do
  addPicture
  updateTags
end
after_update do
  addPicture
  updateTags
end

controller do
  before_action :set_locale_en
  private 
  def addPicture
    
      if permitted_params[:post][:picture].present?
        $pic = Ckeditor::Picture.new(data: permitted_params[:post][:picture])
        @post.cover_img = $pic
        
    end 
  end
  def removePicture
      if @post.cover_img.present? 
          @post.cover_img.destroy
      end
  end
  def updateTags
    
    @post.tags = Tag.where(:id => permitted_params[:post][:tag_ids])
  end

end
# ------------------------ view --------------------
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
      f.inputs 'Content' do
          # f.input :cover_img ,:image_preview => true,label: 'Cover photo'
          f.input :picture ,:as =>"file",:image_preview => true,:image_selected => :cover_img,label: 'Cover photo'
      
      end
      f.input :content, :as => :ckeditor,:class=>'fieldright form-control', input_html: {:ckeditor => {height: 550, :toolbar => 'FULL'}}
    
      f.inputs 'Options' do
      f.input :tags, as: :check_boxes, :collection => Tag.all
      # f.inputs 'Tag' do
        
      #   f.has_many :tags , :allow_destroy => true do |tag|
      #     tag.input :name
      #   end
      # end
      f.input :active,as: :toggleswitch, label: 'Active'
      f.input :isHighlight ,as: :toggleswitch, label: 'Show as highlight topic'
      f.input :isToplist,as: :toggleswitch, label: 'Show in top 10 list'
      f.li do
        f.label 'Publish Post At'
        f.date_field :published_date
      end
      end
    end
    
    f.submit lable: 'Submit'
    render partial: '/layouts/modalholder'
end


end
