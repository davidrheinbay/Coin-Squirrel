class Partner < ApplicationRecord
  has_many :transactions, dependent: :nullify

  # includes image uploaders in Partner
  mount_uploader :logo_image, LogoImageUploader
  mount_uploader :card_image, CardImageUploader

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :company_entity_name, presence: true
  validates :commission_perc, presence: true
  validates :user_commission_perc, presence: true
  validates :referral_link, presence: true
  validates :logo_image, presence: true
  validates :card_image, presence: true
end
