json.extract! shipment, :id, :shipment_date, :details, :order_id, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)
