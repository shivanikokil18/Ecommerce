class CreateShipments < ActiveRecord::Migration[6.1]
  def change
    create_table :shipments do |t|
      t.date :shipment_date
      t.string :details
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
