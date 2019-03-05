class Partner < ApplicationRecord
  has_many :transactions, dependent: :nullify

  # includes image uploaders in Partner
  mount_uploader :logo_image, LogoImageUploader
  mount_uploader :card_image, CardImageUploader
end
