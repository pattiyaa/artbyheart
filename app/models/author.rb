class Author < ApplicationRecord
	attr_accessor :picture
	has_many :projects 
	accepts_nested_attributes_for :projects, :allow_destroy => true
    
	# mount_uploader :avatarimg, CloudinaryImageUploader
	has_one :avatarimg ,:class_name => "Ckeditor::Picture", :as => "assetable"

end
