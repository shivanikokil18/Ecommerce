class Api::V1::ProductsController < ApiController
  def index
    products = Product.all.as_json(except: [:created_at, :updated_at])
    render json: products
  end

  def show
    product = Product.find(params[:id]).as_json(except: [:created_at, :updated_at])
    render json: { status: 'SUCESS', message: 'Loaded required product', data: product }
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: {  message: "created sucessfully", data: product }
    else 
      render json: { message: "Product not created"}, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: { status: :ok, message: "updated sucessfully", data: product }
    else
      render json: { message: "Product not updated" }, status: 500
    end
  end

  def destroy
    product = Product.all
    product = Product.find(params[:id])
    if product.destroy
      render json: { message: "deleted sucessfully", data: product },status: :ok
    else
      render json: { message: "can not delete product" }, status: 500
    end
  end
  
  private
    def product_params
      params.require(:product).permit(:name, :deescription, :price, :discount_price, :tax, :final_value, :product_category_id, :status)
    end
end
