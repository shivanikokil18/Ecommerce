class CreateShipmmentItems < ActiveRecord::Migration[6.1]
  def change
    create_table :shipmment_items do |t|
      t.references :shipment, null: false, foreign_key: true
      t.references :order_item, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
