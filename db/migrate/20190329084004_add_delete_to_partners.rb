class AddDeleteToPartners < ActiveRecord::Migration[5.2]
  def change
    add_column :partners, :deleted, :boolean, default: false
  end
end
