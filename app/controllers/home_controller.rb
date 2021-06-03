class HomeController < ApplicationController
  def index
    @shoppings = Shopping.all
  end

  def list
    restaurants = Restaurant.all
    @restaurants = []
    restaurants.each do |restaurant|
      @restaurants.push(restaurant) if restaurant.Shopping_id.to_s == params[:id]
    end
  end
  
  def show_menu
    @image_path = Restaurant.find(params[:id]).image_link
    @id = Restaurant.find(params[:id]).id
  end

  def order
    @menu = Restaurant.find(params[:id]).menu
  end
end