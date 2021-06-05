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
    @menu = Restaurant.find(params[:restaurant_id]).menu
    qtts = params[:qtts].split "_"
    
    if (@menu.split ",").size == qtts.size
      qtts[params[:dish_number].to_i] = qtts[params[:dish_number].to_i].to_i + 1 if params[:op] == "+"
      qtts[params[:dish_number].to_i] = qtts[params[:dish_number].to_i].to_i - 1 if params[:op] == "-" && qtts[params[:dish_number].to_i].to_i > 0
      
      @qtts = qtts
      @restaurant_id = params[:restaurant_id]
      render :order  
    else
      render :error
    end
  end

  def order_confirmation
    menu = Restaurant.find(params[:restaurant_id]).menu.split ","
    qtts = params[:order_qtt].split "_"
    @order = []
    @order_qtt = []
    @total = 0
    
    qtts.each_with_index do |qtt, index|
      if qtt.to_i > 0
        @order.push(menu[index])
        @order_qtt.push(qtt)
        @total += qtt.to_f * ((menu[index].split "/")[1]).to_f
      end
    end
  end
end