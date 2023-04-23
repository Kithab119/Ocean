class Item < ApplicationRecord

  belongs_to :creator
  belongs_to :color
  belongs_to :size
  belongs_to :genre
  belongs_to :style
  has_many :cart_items
  has_many :order_details

end
