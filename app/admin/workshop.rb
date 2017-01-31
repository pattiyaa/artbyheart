ActiveAdmin.register Workshop do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :author_id, :category_id, :start, :finish, :title, :description, :pictures,:capacity, :available_on, :discontinue_on, :price, :cost, :slung, :meta_title, :meta_description, :meta_keywords
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

after_create do
    updatepicture
end
after_update do 
    updatepicture
end
# ------------------------ view --------------------

index as: :block  do |workshop|
  div for: workshop ,:class=>"row" do
    div :class=>"col-xs-12 col-sm-12 col-md-1" do
      resource_selection_cell workshop
    end
    div :class=>"col-xs-12 col-sm-12 col-md-4" do
      link_to image_tag(workshop.pictures.first.url ,:class=>"img-thumbnail") , admin_workshop_path(workshop) if workshop.pictures.present?

    end
    div :class=>"col-xs-12 col-sm-12 col-md-6" do
      link_to content_tag(:h4,workshop.title), admin_workshop_path(workshop) 
      div strong workshop.title
      div simple_format workshop.author.name if workshop.author.present?
      div span t('active_admin.price') 
          span workshop.price if workshop.price.present?
    end
    div :class=>"col-xs-12 col-sm-12 col-md-1" do 
        span link_to( t(:edit), edit_admin_workshop_path(workshop))
        span link_to( t(:delete), admin_workshop_path(workshop), method: :delete, data: { confirm: t(:confirm_delete) })
      
    end
  end
end

controller do
    before_action :set_locale_en
    def updatepicture

        @pics=[]
        params[:workshop][:pictures].each do |pic|
            begin
                if eval(pic)[:id].present?
                    @pics.push(Ckeditor::Picture.find(eval(pic)[:id]))
                end
            rescue
                @pics.push(Ckeditor::Picture.new(data: pic))
            end
        end
        @workshop.pictures =@pics 
        @workshop.save
    end
end

form do |f|
	f.inputs 'Details' do
		
		f.li do
			f.label 'Author'
			f.collection_select :author_id, Author.all, :id, :name, { include_blank: 'Select one' }
		end
		f.li do
			f.label 'Category'
			f.collection_select :category_id, Category.all, :id, :name, { include_blank: 'Select one' }
		end
		
		f.input :start , :as => :date_picker 
		f.input :finish, :as => :date_picker 

		f.input :title
		f.input :description, :as => :ckeditor,input_html: {:ckeditor => {height: '200px', :toolbar => 'mini'}}
    	f.input  :pictures, :as => :filesupload,:image_preview=> true

    end
    f.inputs 'Marketing' do
    	f.input :capacity
    	f.input :available_on , :as => :datetime_picker 
    	f.input :discontinue_on , :as => :datetime_picker 
    	f.input :price
    	f.input :cost
    end
    f.inputs 'SEO' do
    	f.input :slung
    	f.input :meta_title
    	f.input :meta_description
    	f.input :meta_keywords
    end
    f.submit
end


end
