class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :tracking_number
      t.date :order_placed_date
      t.string :status
      t.string :enum
      t.references :user, null: false, foreign_key: true
      t.references :user_address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
