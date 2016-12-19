ActiveAdmin.register User do
  menu parent: "Setting"	
  permit_params :email, :password, :password_confirmation
  controller do
    before_action :set_locale_en
  end
end
