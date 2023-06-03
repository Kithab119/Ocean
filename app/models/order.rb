class Order < ApplicationRecord

  belongs_to :customer
  belongs_to :creator

  has_many :order_details, dependent: :destroy
  has_one :making, dependent: :destroy

  enum payment: {credit_card: 0, transfer: 1}
  enum is_receive: {waiting_payment: 0, check_payment: 1, preparation: 2, shipping: 3}

end
