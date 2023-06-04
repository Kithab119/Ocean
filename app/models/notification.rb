class Notification < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  belongs_to :making, optional: true
  belongs_to :order, optional: true
  belongs_to :room, optional: true

end
