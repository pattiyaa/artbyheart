class Post < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, 
  #        :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :cover_img, CloudinaryImageUploader
  has_and_belongs_to_many :tags
  has_one :post_category
  def email_required? 
  	false 
  end

  def email_changed? 
  	false 
  end
end