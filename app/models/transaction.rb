class Transaction < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :partner, optional: true

  validates :game, presence: true
  validates :transaction_type, inclusion: { in: ['cash_in', 'cash_out'] }
  validates :gmv_eur, presence: true, if: proc { |a| a.transaction_type == "cash_in" }
  validates :link_used, presence: true, if: proc { |a| a.transaction_type == "cash_in" }
  validates :partner, presence: true, if: proc { |a| a.transaction_type == "cash_in" }
  validates :commission_perc, presence: true, if: proc { |a| a.transaction_type == "cash_in" }
  validates :user_commission_share_perc, presence: true, if: proc { |a| a.transaction_type == "cash_in" }
  validates :user_commission_amount, presence: true
  validates :eur_currency_rate, presence: true, if: proc { |a| a.transaction_type == "cash_in" }
  validates :transaction_confirmed_date, presence: true
  validates :transaction_completed_date, presence: true, if: proc { |a| a.state == "completed" }
  validates :state, inclusion: { in: ["confirmed", "completed"] }

  monetize :gmv_eur_cents
  monetize :user_commission_amount_cents
end
