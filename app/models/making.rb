class Making < ApplicationRecord

  belongs_to :customer
  belongs_to :creator

  enum is_product: {waiting: 0, product: 1, complete: 2}

end
