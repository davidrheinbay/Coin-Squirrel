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
  mount_uploader :currency_image, CurrencyImageUploader
  mount_uploader :game_character_image, GameCharacterImageUploader
  mount_uploader :banner_image, BannerImageUploader
  mount_uploader :premium_item_image, PremiumItemImageUploader
  mount_uploader :shopping_cart_image, ShoppingCartImageUploader
  mount_uploader :store_image, StoreImageUploader

  def fetch_items
    "#{name}ItemsLoader".constantize.call
  end
end
