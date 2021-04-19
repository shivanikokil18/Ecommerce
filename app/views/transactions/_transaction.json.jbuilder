json.extract! transaction, :id, :mode, :status, :transaction_date, :total_amount, :user_id, :order_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
