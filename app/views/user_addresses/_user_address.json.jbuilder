json.extract! user_address, :id, :address, :city, :pincode, :state, :country, :phn_no, :residencial_phn_no, :user_id, :created_at, :updated_at
json.url user_address_url(user_address, format: :json)
