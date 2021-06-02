json.extract! shipmment_item, :id, :shipment_id, :order_item_id, :status, :created_at, :updated_at
json.url shipmment_item_url(shipmment_item, format: :json)
