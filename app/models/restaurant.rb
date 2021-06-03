class Restaurant < ApplicationRecord
  belongs_to :Shopping
  validates :name, :image_link, presence: true
end
