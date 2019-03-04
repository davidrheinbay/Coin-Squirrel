class AddImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image, :string
    add_reference :users, :game, foreign_key: true
    add_monetize :users, :balance, currency: { presence: false }
  end
end
