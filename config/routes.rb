Rails.application.routes.draw do
  root "restaurants#index"
  
  get "/login" => "restaurants#login"
  get "/shopping/:id" => "restaurants#shopping_restaurants"
  post "/restaurants/new" => "restaurants#new"
  post "/restaurants/all" => "restaurants#all"
  get "/restaurants/all" => "restaurants#index"

  resources :restaurants  
end
