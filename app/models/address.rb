class Address < ApplicationRecord

  belongs_to :customer

  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }

  def address_display
    '〒' + postal_code.insert(3, "-") + ' ' + address + ' ' + name
  end

end
