class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :shopping, presence: true
  validates :image_link, presence: true
end
