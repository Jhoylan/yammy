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
    @qtts = []
    (@menu.split ",").size.times { @qtts.push(0) }
    @restaurant_id = params[:id]
  end

  def qtt
    qtts = params[:qtts].split "_"
    qtts[params[:dish_number].to_i] = qtts[params[:dish_number].to_i].to_i + 1 if params[:op] == "+"
    qtts[params[:dish_number].to_i] = qtts[params[:dish_number].to_i].to_i - 1 if params[:op] == "-" && qtts[params[:dish_number].to_i].to_i > 0
    @menu = Restaurant.find(params[:restaurant_id]).menu
    @qtts = qtts
    @restaurant_id = params[:restaurant_id]
    render :order
  end
end