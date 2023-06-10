class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum is_sent: {preparation: 0, shipping: 1}

end
