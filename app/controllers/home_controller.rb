class HomeController < ApplicationController
  before_action :authenticate_user!

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
    @menu = Restaurant.find(params[:restaurant_id]).menu
    @id = params[:restaurant_id]
    qtts = params[:qtts].split "_"
    qtt = qtts[params[:dish_number].to_i].to_i 

    qtt_is_a_number = is_a_number qtts[params[:dish_number].to_i] 
    
    if ((@menu.split ",").size == qtts.size) && (qtt >= 0 && qtt < 100) && qtt_is_a_number
      qtts[params[:dish_number].to_i] = qtts[params[:dish_number].to_i].to_i + 1 if params[:op] == "+"
      qtts[params[:dish_number].to_i] = qtts[params[:dish_number].to_i].to_i - 1 if params[:op] == "-" && qtts[params[:dish_number].to_i].to_i > 0
      
      @qtts = qtts
      @restaurant_id = params[:restaurant_id]
      render :order    
    else
      render :invalid_qtt
    end
  end

  private
  def is_a_number string
    return true if string.to_i.to_s == string
    return false
  end
end