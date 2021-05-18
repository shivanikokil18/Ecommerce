class RemoveEnumFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :enum, :string
  end
end
