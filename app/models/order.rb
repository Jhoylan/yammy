class Order < ApplicationRecord
  belongs_to :user
  serialize :order_info, Array
end
