class Game < ApplicationRecord
  has_many :users
  has_many :exchange_rates

  validates :name, presence: true, uniqueness: true
  validates :currency_name, presence: true
  validates :currency_short, presence: true
end
