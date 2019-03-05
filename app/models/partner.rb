class Partner < ApplicationRecord
  has_many :transactions

  validates :name, presence: true
  validates :company_entity_name, presence: true
  validates :company_entity_name, uniqueness: true
  validates :commission_perc, presence: true
  validates :user_commission_perc, presence: true
  validates :referral_link, presence: true
  validates :logo_image, presence: true
  validates :card_image, presence: true
end
