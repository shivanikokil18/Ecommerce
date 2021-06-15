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
    order = Order.new(order_params)
    if order.save
      render json: { message: "Order placed", data: order}
    else 
      render json: { message: "Order not placed" }, status: :unprocessable_entity
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    render json: { message: "deleted sucessfully", data: order },status: :ok
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      render json: { messaage: "updated successfully", data: order}
    else 
      render json: { message: "updation failed"}, status: 500
    end
  end

  private
    def order_params
      params.require(:order).permit(:tracking_number, :order_placed_date, :status, :user_id, :user_address_id)
    end
end