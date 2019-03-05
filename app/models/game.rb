class Game < ApplicationRecord
  has_many :transactions, dependent: :nullify
  has_many :users, dependent: :nullify
  has_many :exchange_rates, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :currency_name, presence: true
  validates :currency_short, presence: true

  # includes image uploaders in Partner
  mount_uploader :logo_image, LogoImageUploader
  mount_uploader :card_image, CardImageUploader
end
