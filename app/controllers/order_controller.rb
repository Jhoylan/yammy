class OrderController < ApplicationController
  before_action :get_today_open_orders, only: %i[index confirm bill]

  def index
  end

  def create
    @menu = Restaurant.find(params[:restaurant_id]).menu
    @restaurant_id = params[:restaurant_id]
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
                      restaurant: params[:restaurant_id],
                      open: true)
    
    if order.save && qtt_is_valid
      @msg = "Pedido enviado ao carrinho."
    else
      @msg = "Não foi possível efetuar o pedido."
    end

    render "home/order"
  end

  def confirm
    @total = 0
    @today_open_orders.each do |order|
      order.order_info.each do |cost|
        @total += cost[1].to_f * cost[2].to_f
      end
    end
  end

  def bill
    @today_open_orders.each do |order|
      order.update(open: false)
    end
  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to order_index_path
  end

  private
  def get_today_open_orders
    today = Time.now.day
    all_orders = Order.where(user_id: current_user.id, open: true)
    @today_open_orders = []

    all_orders.each do |order|
      @today_open_orders.push order if order.created_at.day == today
    end
  end

  def is_a_number string
    return true if string.to_i.to_s == string
    return false
  end
end