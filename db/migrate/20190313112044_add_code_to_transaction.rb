class AddCodeToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :game_code, :string, default: "WGSH56768HGJFDSGW"
  end
end
