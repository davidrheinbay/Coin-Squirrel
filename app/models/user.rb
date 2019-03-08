class User < ApplicationRecord
  has_many :transactions, dependent: :destroy
  belongs_to :game

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :game, presence: true

  validates :balance_cents, presence: true

  # make cents only integers
  monetize :balance_cents, numericality: { greater_than_or_equal_to: 0 }

  # includes Profile Image Uploader in User
  mount_uploader :profile_image, ProfileImageUploader
end
