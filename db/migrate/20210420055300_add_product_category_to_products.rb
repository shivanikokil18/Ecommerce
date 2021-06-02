class AddProductCategoryToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :product_category, null: true, foreign_key: true
  end
end
