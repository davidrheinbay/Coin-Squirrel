class AddStoreImgToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :store_image, :string
    add_column :games, :description, :string
  end
end
