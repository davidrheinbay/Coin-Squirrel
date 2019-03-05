class Game < ApplicationRecord
  has_many :transactions, dependent: :nullify
  has_many :users
  has_many :exchange_rates, dependent: :destroy
end
