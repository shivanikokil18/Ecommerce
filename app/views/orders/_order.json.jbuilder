json.extract! order, :id, :tracking_number, :order_placed_date, :status, :enum, :user_id, :user_address_id, :created_at, :updated_at
json.url order_url(order, format: :json)
