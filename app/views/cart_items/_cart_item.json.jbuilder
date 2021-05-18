json.extract! cart_item, :id, :base_price, :discount, :tax, :total_price, :product_id, :cart_id, :created_at, :updated_at
json.url cart_item_url(cart_item, format: :json)
