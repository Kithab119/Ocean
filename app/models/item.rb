class Item < ApplicationRecord

  has_one_attached :image

  belongs_to :creator
  belongs_to :color
  belongs_to :size
  belongs_to :genre
  belongs_to :style

  has_many :cart_items
  has_many :order_details
  has_many :notifications

  def self.looks(word)
    return Item.all unless word
    Item.where('name LIKE ?', "%#{word}%")
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(gravity: :center, resize:"768x1024^", crop:"768x1024+0+0").processed
  end

end
