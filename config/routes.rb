Rails.application.routes.draw do
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "welcome#index"
  resources :restaurants
  get "/list/:id" => "home#list"
  get "/show_menu/:id" => "home#show_menu"
  get "/order/:id" => "home#order"
  get "/qtt/:op/:dish_number/:qtts/:restaurant_id" => "home#qtt"
  get "/order_confirmation/:restaurant_id/:order_qtt" => "home#order_confirmation"
end
