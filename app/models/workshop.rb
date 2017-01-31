class Workshop < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :pictures, :class_name => "Ckeditor::Picture", :as => "assetable"

end
