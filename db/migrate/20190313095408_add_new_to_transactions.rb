class AddNewToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :is_new, :boolean, default: true
  end
end
