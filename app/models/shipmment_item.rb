class ShipmmentItem < ApplicationRecord
  belongs_to :shipment
  belongs_to :order_item
end
