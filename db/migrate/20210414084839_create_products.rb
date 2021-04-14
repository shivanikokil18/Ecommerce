class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :deescription
      t.float :price
      t.float :discount_price
      t.float :tax
      t.float :final_value

      t.timestamps
    end
  end
end
