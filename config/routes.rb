Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" ,:registrations => "registrations",
    :sessions=>"sessions"}
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # resources :photos, :only => [:index, :new, :create,:show]
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