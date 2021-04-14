json.extract! product, :id, :name, :deescription, :price, :discount_price, :tax, :final_value, :created_at, :updated_at
json.url product_url(product, format: :json)
