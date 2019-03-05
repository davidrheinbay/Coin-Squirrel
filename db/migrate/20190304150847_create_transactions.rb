class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.string :transaction_type
      t.monetize :gmv_eur, currency: { presence: false }
      t.float :commission_perc
      t.float :user_commission_share_perc
      t.monetize :user_commission_amount, currency: { presence: true }
      t.float :eur_currency_rate
      t.string :link_used
      t.references :partner, foreign_key: true
      t.references :game, foreign_key: true
      t.datetime :transaction_confirmed_date
      t.datetime :transaction_completed_date
      t.string :state

      t.timestamps
    end
  end
end
