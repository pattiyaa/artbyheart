Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :controllers => { 
    :registrations => "users/registrations",
    :confirmations => "users/confirmations",
    :omniauth_callbacks => "users/omniauth_callbacks",
    :sessions => "users/sessions",
    :passwords =>"users/passwords"}, :path_names=> { 
      :sign_in => 'login',
      :password => 'forgot', 
      :confirmation => 'confirm', 
      :unlock => 'unblock', 
      :sign_up => 'register', 
      :sign_out => 'signout'}
 
  # devise_scope :users do
  #   get "/users/route" => "app/devise"
  #   get 'users/signup' => 'devise/registrations#new', :as => :new_user_registration 
  #   post 'users/signup' => 'devise/registrations#create', :as => :user_registration
  #   delete 'users/signup' => 'devise/registrations#destroy', :as => :destroy_user_registration
  # end
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "/:locale" do
    resources :about do 
      collection do
        get 'map'
      end
    end
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
  root 'home#index'
 end