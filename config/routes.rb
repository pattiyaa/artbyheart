Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :controllers => { 
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "users/registrations",
    :sessions => "users/sessions",
    :passwords =>"users/passwords"}
  namespace :users do
    resources :registrations
  end
  # devise_scope :users do
  #   get 'users/signup' => 'devise/registrations#new', :as => :new_user_registration 
  #   post 'users/signup' => 'devise/registrations#create', :as => :user_registration
  #   delete 'users/signup' => 'devise/registrations#destroy', :as => :destroy_user_registration
  # end
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
  resources :posts, :only =>[:index, :show]
  resources :articles, :only =>[:index, :show]
  resources :howtos, :only =>[:index, :show]
  resources :activities, :only =>[:index, :show]
  resources :projects, :only =>[ :show]
  resources :therapists, :only =>[:index, :show]
  resources :home
  get 'home/index'
  root 'home#index'
 end