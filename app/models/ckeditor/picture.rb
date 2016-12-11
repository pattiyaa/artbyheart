class Ckeditor::Picture < Ckeditor::Asset
  mount_uploader :data, CloudinaryImageUploader, mount_on: :data_file_name
  has_and_belongs_to_many :projects
  belongs_to :author
  def url_content
    url(:content)
  end
end
