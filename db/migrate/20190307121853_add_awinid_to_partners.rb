class AddAwinidToPartners < ActiveRecord::Migration[5.2]
  def change
    add_column :partners, :awin_advertiser_id, :string
  end
end
