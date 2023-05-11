class Review < ApplicationRecord

  belongs_to :customer
  belongs_to :creator

  validates :customer_id, uniqueness: {scope: :creator_id}

end
