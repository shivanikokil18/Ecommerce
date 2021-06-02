class Shipment < ApplicationRecord
  belongs_to :order

  has_many :shipmment_items
end
