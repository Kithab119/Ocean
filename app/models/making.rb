class Making < ApplicationRecord

  has_one :room

  belongs_to :customer
  belongs_to :creator
  belongs_to :order, optional: true

  enum is_product: {confirm: 0,approved: 1,product_waiting: 2, product: 3, complete: 4}

end
