class Making < ApplicationRecord

  belongs_to :customer
  belongs_to :creator

  enum is_product: {confirm: 0,approved: 1,product_waiting: 2, product: 3, complete: 4}

end
