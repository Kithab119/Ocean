class Message < ApplicationRecord

  belongs_to :room
  belongs_to :customer, optional: true
  belongs_to :creator, optional: true

  delegate :making, to: :room
  delegate :creator, to: :making
  delegate :customer, to: :making


  def send_by_customer
    sender == Customer.name
  end

  def send_by_creator
    sender == Creator.name
  end

end
