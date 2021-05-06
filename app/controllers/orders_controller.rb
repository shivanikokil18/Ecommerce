class OrdersController < ApplicationController
  load_and_authorize_resource
  #before_action :zero_users_or_authenticated, only: [:read]

  before_action :set_order, only: %i[ show edit update destroy ]
  
  # GET /orders or /orders.json
  def index
    #@orders = Order.all
    @orders = Order.accessible_by(current_ability)
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @users = User.all
    @user_addresses = UserAddress.all
  end

  # GET /orders/1/edit
  def edit
    @users = User.all
    @user_addresses = UserAddress.all
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy 
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:tracking_number, :order_placed_date).merge({status: params[:status].to_i, user_id: params[:user_id], user_address_id: params[:user_address_id]})
    end
end
