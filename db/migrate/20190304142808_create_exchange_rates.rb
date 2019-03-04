class CreateExchangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_rates do |t|
      t.string :currency_origin_short
      t.string :currency_target_short
      t.float :rate
      t.datetime :date_created
      t.datetime :date_updated
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
