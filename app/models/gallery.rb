class Gallery < ApplicationRecord

  belongs_to :creator

  geocoded_by :address
  after_validation :geocode

end
