class Address < ApplicationRecord

  belongs_to :customer

  def address_display
    '〒' + postal_code.insert(3, "-") + ' ' + address + ' ' + name
  end

end
