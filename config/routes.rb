Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" } 
  

  root to: "articles#index"
  resources :articles do
    resources :comments
    resources :likes
  end
  resources :users
  namespace 'api' do
    namespace 'v1' do
      resources :articles
      resources :users
    end
  end

   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
