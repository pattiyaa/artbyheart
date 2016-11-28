class Author < ApplicationRecord
	mount_uploader :avatarimg, CloudinaryImageUploader
    
end
