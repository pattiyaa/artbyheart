class Project < ApplicationRecord
    belongs_to :author
	has_and_belongs_to_many :pictures, :class_name => "Ckeditor::Picture"
end
