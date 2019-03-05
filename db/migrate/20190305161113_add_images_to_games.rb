class AddImagesToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :card_image, :string
    add_column :games, :logo_image, :string
  end
end
