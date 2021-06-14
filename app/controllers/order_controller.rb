class OrderController < ApplicationController
  def index
    today = Time.now.day
    all_orders = Order.where(user_id: current_user.id)
    @today_orders = []

    all_orders.each do |order|
      @today_orders.push order if order.created_at.day == today
    end
  end

  def create
    @menu = Restaurant.find(params[:restaurant_id]).menu
    @qtts = (params[:order_qtt]).split "_"
    order_info = []
    menu = @menu.split ","
    @to_show_msg = true
    qtt_is_valid = true

    @qtts.each_with_index do |qtt, index|
      if qtt.to_i > 0
        dish = ((menu[index]).split "/")[0]
        price = ((menu[index]).split "/")[1]
        order_info.push([dish, price, qtt])  
      end
      
      if qtt.to_i < 0 || qtt.to_i > 100 || !(is_a_number qtt)
        qtt_is_valid = false
      end   
    end

    order = Order.new(order_info: order_info,
                      user_id: current_user.id,
                      restaurant: params[:restaurant_id])
    
    if order.save && qtt_is_valid
      @msg = "Pedido enviado ao carrinho."
    else
      @msg = "Não foi possível efetuar o pedido."
    end

    render "home/order"
  end

  def confirm

  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to "/order/index/#{current_user.id}"
  end

  private
  def is_a_number string
    return true if string.to_i.to_s == string
    return false
  end
end