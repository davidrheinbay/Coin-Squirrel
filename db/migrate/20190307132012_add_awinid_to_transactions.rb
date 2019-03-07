class AddAwinidToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :awin_transaction_id, :string
  end
end
