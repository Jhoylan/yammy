Rails.application.routes.draw do
  # Autenticação de usuários
  devise_for :users
  mount TokenAuthenticateMe::Engine => TokenAuthenticateMe.configuration.mount_path
  get 'home/index'
  
  # Autenticação de administradores
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # Rotas usuais
  root "welcome#index"
  resources :restaurants
  get "/list/:id" => "home#list"
  get "/show_menu/:id" => "home#show_menu"
  get "/order/:id" => "home#order"
  get "/qtt/:op/:dish_number/:qtts/:restaurant_id" => "home#qtt"
  get "/cart/:restaurant_id/:order_qtt" => "home#cart"
end
