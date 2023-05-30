class Message < ApplicationRecord

  belongs_to :room
  belongs_to :customer, optional: true
  belongs_to :creator, optional: true

end
