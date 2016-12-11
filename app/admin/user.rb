ActiveAdmin.register User do
	menu parent: "Setting"	
  permit_params :email, :password, :password_confirmation
end
