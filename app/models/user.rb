class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessor :imgtemp
  # has_one :image ,:class_name => "Ckeditor::Picture", :as => "assetable"

  mount_uploader :tempimage, CloudinaryImageUploader
  devise :database_authenticatable, 
         :recoverable,:registerable, :rememberable, :trackable, :validatable,:confirmable, :omniauthable, :omniauth_providers => [:facebook,:google_oauth2]
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.image = auth.info.image
      end
  end

end