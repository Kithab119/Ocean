class Creator < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :makings
  has_many :reviews
  has_many :follows
  has_many :galleries
  has_many :messages

  has_one_attached :profile_image

  validates :name, length: { minimum: 1, maximum: 20 }
  validates :profile, length: { minimum: 1, maximum: 300 }
  VALID_POSTAL_CODE_REGIX = /\A\d{7}\z/
  validates :postal_code, format: { with: VALID_POSTAL_CODE_REGIX }
  validates :address, presence: true
  VALID_TELEPHONE_NUMBER_REGIX = /\A\d{11}\z/
  validates :telephone_number, format: { with: VALID_TELEPHONE_NUMBER_REGIX }


  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
