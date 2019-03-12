class AddTagsToPartners < ActiveRecord::Migration[5.2]
  def change
    add_column :partners, :tags, :string, array: true, default: []
  end
end
