class ShipmmentItemsController < ApplicationController
  before_action :set_shipmment_item, only: %i[ show edit update destroy ]

  # GET /shipmment_items or /shipmment_items.json
  def index
    @shipmment_items = ShipmmentItem.all
  end

  # GET /shipmment_items/1 or /shipmment_items/1.json
  def show
  end

  # GET /shipmment_items/new
  def new
    @shipmment_item = ShipmmentItem.new
  end

  # GET /shipmment_items/1/edit
  def edit
  end

  # POST /shipmment_items or /shipmment_items.json
  def create
    @shipmment_item = ShipmmentItem.new(shipmment_item_params)

    respond_to do |format|
      if @shipmment_item.save
        format.html { redirect_to @shipmment_item, notice: "Shipmment item was successfully created." }
        format.json { render :show, status: :created, location: @shipmment_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shipmment_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipmment_items/1 or /shipmment_items/1.json
  def update
    respond_to do |format|
      if @shipmment_item.update(shipmment_item_params)
        format.html { redirect_to @shipmment_item, notice: "Shipmment item was successfully updated." }
        format.json { render :show, status: :ok, location: @shipmment_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shipmment_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipmment_items/1 or /shipmment_items/1.json
  def destroy
    @shipmment_item.destroy
    respond_to do |format|
      format.html { redirect_to shipmment_items_url, notice: "Shipmment item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipmment_item
      @shipmment_item = ShipmmentItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipmment_item_params
      params.require(:shipmment_item).permit(:shipment_id, :order_item_id, :status)
    end
end
