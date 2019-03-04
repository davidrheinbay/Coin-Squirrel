class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :company_entity_name
      t.float :commission_perc
      t.float :user_commission_perc
      t.string :referral_link
      t.string :logo_image
      t.string :card_image

      t.timestamps
    end
  end
end
