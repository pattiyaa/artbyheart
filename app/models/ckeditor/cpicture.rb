class Ckeditor::cPicture < Ckeditor::Asset
  mount_uploader :data, CloudinaryImageUploader, mount_on: :data_file_name
  #mount_uploader :picture, CloudinaryImageUploader
  def url_content
    url(:content)
  end
end