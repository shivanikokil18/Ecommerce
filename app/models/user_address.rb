class UserAddress < ApplicationRecord
  belongs_to :user

  has_many :orders
  has_many :carts
end
