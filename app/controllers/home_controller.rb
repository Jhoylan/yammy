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
    @id = params[:restaurant_id]
    qtts = params[:qtts].split "_"
    qtt = qtts[params[:dish_number].to_i].to_i 
    
    if ((@menu.split ",").size == qtts.size) && (qtt >= 0 && qtt < 100) 
      qtts[params[:dish_number].to_i] = qtts[params[:dish_number].to_i].to_i + 1 if params[:op] == "+"
      qtts[params[:dish_number].to_i] = qtts[params[:dish_number].to_i].to_i - 1 if params[:op] == "-" && qtts[params[:dish_number].to_i].to_i > 0
      
      @qtts = qtts
      @restaurant_id = params[:restaurant_id]
      render :order    
    else
      render :invalid_qtt
    end
  end

  def order_confirmation
    menu = Restaurant.find(params[:restaurant_id]).menu.split ","
    qtts = params[:order_qtt].split "_"
    qtt_is_valid = true
    @id = params[:restaurant_id]
    @order = []
    @order_qtt = []
    @total = 0
    
    qtts.each_with_index do |qtt, index|
      if qtt.to_i > 0 
        @order.push(menu[index])
        @order_qtt.push(qtt)
        @total += qtt.to_f * ((menu[index].split "/")[1]).to_f
      end
      
      if qtt.to_i < 0 || qtt.to_i > 100    
        qtt_is_valid = false  
      end   
    end

    render :invalid_qtt if !qtt_is_valid
  end
end