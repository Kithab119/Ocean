class Notification < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  belongs_to :customer, optional: true
  belongs_to :creator, optional: true
  belongs_to :room, optional: true

end
