class Api::V1::OrdersController < ApiController
  def index
    orders = Order.all.as_json(except: [:created_at, :updated_at])
    render json: orders
  end

  def show 
    order = Order.find(params[:id])
    render json: order
  end

  def create
    
  end
end