class HomeController < ApplicationController
  def index
    @shoppings = Shopping.all
  end
  def shopping_list
    restaurants = Restaurant.all
    @restaurants = []
    restaurants.each do |restaurant|
      @restaurants.push(restaurant) if restaurant.Shopping_id.to_s == params[:id]
    end
  end
end