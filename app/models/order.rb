class Order < ApplicationRecord
  belongs_to :user
  belongs_to :user_address

  has_many :shipments
  has_many :order_items
  has_many :transactions
  
  enum status: [:placed, :not_placed, :not_set]
end
