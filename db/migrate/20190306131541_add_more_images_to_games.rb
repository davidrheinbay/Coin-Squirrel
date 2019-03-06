class AddMoreImagesToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :banner_image, :string
    add_column :games, :game_character_image, :string
    add_column :games, :shopping_cart_image, :string
    add_column :games, :premium_item_image, :string
  end
end
