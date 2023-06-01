class Room < ApplicationRecord

  has_many :messages
  has_many :notifications, dependent: :destroy

  belongs_to :making

end
