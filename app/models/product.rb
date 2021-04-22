class Product < ApplicationRecord

    enum status: [:available, :out_of_stock, :not_set]

    has_many :order_items
    has_many :cart_items
    has_many :product_reviews

end
