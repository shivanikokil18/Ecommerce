class CreateUserAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :user_addresses do |t|
      t.string :address
      t.string :city
      t.integer :pincode
      t.string :state
      t.string :country
      t.string :phn_no
      t.string :residencial_phn_no
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
