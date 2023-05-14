class Follow < ApplicationRecord

  belongs_to :customer
  belongs_to :creator

end
