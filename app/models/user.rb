class User < ApplicationRecord
  has_many :transactions, dependent: :destroy
  belongs_to :game

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # make cents only integers
  monetize :balance_cents

  # includes Profiele Image Uploader in User
  mount_uploader :profile_image, ProfileImageUploader
end
