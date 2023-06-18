class Customer < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :makings
  has_many :reviews
  has_many :follows
  has_many :messages

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  VALID_POSTAL_CODE_REGIX = /\A\d{7}\z/
  validates :postal_code, format: { with: VALID_POSTAL_CODE_REGIX }
  validates :address, presence: true
  VALID_TELEPHONE_NUMBER_REGIX = /\A\d{11}\z/
  validates :telephone_number, format: { with: VALID_TELEPHONE_NUMBER_REGIX }

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "下衆"
      customer.first_name = "太郎"
      customer.last_name_kana = "ゲス"
      customer.first_name_kana = "タロウ"
      customer.postal_code = "5310103"
      customer.address = "ゲストルーム"
      customer.telephone_number = "53101031030"
      # customer.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

end
