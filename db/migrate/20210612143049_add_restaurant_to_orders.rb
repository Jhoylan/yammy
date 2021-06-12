class AddRestaurantToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :restaurant, :string
  end
end
