Rails.application.routes.draw do
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "welcome#index"
  resources :restaurants
  get "/shopping_list/:id" => "home#shopping_list"
end
