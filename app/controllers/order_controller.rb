class OrderController < ApplicationController
  before_action :get_today_open_orders, only: %i[index confirm bill]

  def index
    @shipping = get_shipping
    @missing_orders_to_discount = 5 - (Order.where(open: false).size % 5)
    @discount = get_discount
  end

  def create
    
    destroy_old_orders

    @menu = Restaurant.find(params[:restaurant_id]).menu
    @restaurant_id = params[:restaurant_id]
    @qtts = (params[:order_qtt]).split "_"

    order_is_blank = @qtts.all? "0"

    if order_is_blank
      @qtts.map! {|qtt| qtt.to_i }
      return render "home/order"
    end

    @to_show_msg = true
        
    order_info = []
    menu = @menu.split ","
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

    @total -= @total * get_discount if (Order.where(open: false).size % 5) == 0
    @total += get_shipping
  end

  def bill
    @today_open_orders.each do |order|
      order.update(open: false)
    end
  end

  def update
    order = Order.find(params[:id])
    order_info = order.order_info
    
    return redirect_to order_index_path unless is_a_valid_index params[:index], order_info.size
    
    order_info.delete_at(params[:index].to_i)
    order.update(order_info: order_info)
    
    destroy params[:id] if order_info.size == 0

    redirect_to order_index_path
  end

  private
  def destroy_old_orders
    Order.where(user_id: current_user.id, open: true).each do |order|
      order.destroy if order.created_at.before? (Date.new(Time.now.year, Time.now.month, Time.now.day))
    end
  end

  def destroy id
    Order.find(id).destroy
  end

  def get_today_open_orders
    today = Time.now.day
    all_orders = Order.where(user_id: current_user.id, open: true)
    @today_open_orders = []

    all_orders.each do |order|
      @today_open_orders.push order if order.created_at.day == today 
    end
  end

  def get_discount
    return 0.2
  end

  def get_shipping
    return 10
  end

  def is_a_number string
    return true if string.to_i.to_s == string
    return false
  end

  def is_a_valid_index index, size
    (is_a_number index) && index.to_i >= 0 && index.to_i < size
  end
end