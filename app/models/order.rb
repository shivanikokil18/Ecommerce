class Order < ApplicationRecord
  belongs_to :user
  belongs_to :user_address

  has_many :shipments
end
