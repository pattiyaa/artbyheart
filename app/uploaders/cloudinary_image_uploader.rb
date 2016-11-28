# encoding: utf-8

class CloudinaryImageUploader < CarrierWave::Uploader::Base

   include Sprockets::Rails::Helper
  # include Sprockets::Rails::Helpers::IsolatedHelper

  include Cloudinary::CarrierWave
  

  process :tags => ["photo_album_sample"]
  process :convert => "jpg"
  process :use_filename => true

 version :thumb do
    process resize_to_fill: [118, 100]
  end

  version :content do
    process resize_to_limit: [1200, 1200]
  end
  version :thumbnail do
    eager
    resize_to_fit(150, 150)
    cloudinary_transformation :quality => 80          
  end  
  version :standard do
    process :resize_to_fill => [1200, 1200, :north]
  end
  # For more options, see
  # http://cloudinary.com/documentation/rails_integration#carrierwave
 
 
  def extension_white_list
    Ckeditor.image_file_types
  end

end
