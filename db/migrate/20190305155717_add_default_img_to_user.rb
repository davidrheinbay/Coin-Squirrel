class AddDefaultImgToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :profile_image, :string, default: 'https://res.cloudinary.com/dmr1qubzk/image/upload/v1551801247/765-default-avatar.png'
  end
end
