class AddAmountToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :amount, :integer
  end
end
