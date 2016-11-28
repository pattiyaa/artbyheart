Rails.application.routes.draw do


  

  
  
  resources :tags
  devise_for :admin_users, ActiveAdmin::Devise.config
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # namespace :admin do
  #   resources :tag
  # end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
   resources :photos, :only => [:index, :new, :create,:show]
  
 end
