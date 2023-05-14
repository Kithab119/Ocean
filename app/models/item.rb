class Item < ApplicationRecord

  has_one_attached :image

  belongs_to :creator
  belongs_to :color
  belongs_to :size
  belongs_to :genre
  belongs_to :style
  has_many :cart_items
  has_many :order_details

  def self.looks(word)
    return Item.all unless word
    Item.where('name LIKE ?', "%#{word}%")
  end

end
