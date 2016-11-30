class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook,:google_oauth2]
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
  # def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
  # 	user = User.where(:provider => auth.provider, :uid => auth.uid).first
  # 	if user
  # 		return user
  # 	else
  # 		registered_user = User.where(:email => auth.info.email).first
  # 		if registered_user
  # 			return registered_user
  # 		else
  # 			auth.provider = “Facebook”
  # 			user = User.create!(first_name:auth.extra.raw_info.first_name,
  # 				last_name:auth.extra.raw_info.last_name,
  # 				provider:auth.provider,
  # 				email:auth.info.email,
  # 				password:Devise.friendly_token[0,20],
  #         confirmed_at:Time.zone.now )
  # 		end
  # 	end
  # end
  # def self.find_for_google_oauth2(access_token, signed_in_resource = nil)
  # 	data = access_token.info
  # 	user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
  # 	if user
  # 		return user
  # 	else
  # 		registered_user = User.where(:email => access_token.info.email).first
  # 		if registered_user
  # 			return registered_user
  # 		else
  # 			access_token.provider = “Google”
  # 			user = User.create(first_name: data[“first_name”],
  # 				last_name: data[“last_name”],
  # 				provider:access_token.provider,
  # 				email: data[“email”],
  # 				password: Devise.friendly_token[0,20],
  #         confirmed_at:Time.zone.now )
  # 		end
  # 	end
  # end
end