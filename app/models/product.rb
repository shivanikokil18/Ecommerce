class Product < ApplicationRecord

    enum status: [:available, :out_of_stock, :not_set]

    belongs_to :product_categoty

    has_many :order_items
    has_many :cart_items
    has_many :product_reviews

    enum status: [:in_stock, :only_few_left, :not_available]

end
