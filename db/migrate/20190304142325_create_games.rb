class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :currency_name
      t.string :currency_short

      t.timestamps
    end
  end
end
