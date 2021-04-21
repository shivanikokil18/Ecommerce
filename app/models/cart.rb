class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :user_address

  has_many :cart_items
end
