class Product < ApplicationRecord

  enum status: [:available, :out_of_stock, :only_few_left, :not_set]

  belongs_to :product_category

  has_many :order_items
  has_many :cart_items
  has_many :product_reviews
end
