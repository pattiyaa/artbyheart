Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" ,:registrations => "registrations",
    :sessions=>"sessions"}
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'
  # namespace :admin do
  #   resources :tag
  # end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # resources :photos, :only => [:index, :new, :create,:show]
  resources :posts
  resources :home
  get 'home/index'
  root 'home#index'
 end