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
      render json: { status: 'ERROR', message: "Product not updated", data: product.errors}, status: :error
    end
  end

  def destroy
    product = Product.all
    product = Product.find(params[:id])
    if product.destroy
      render json: { status: :ok, message: "deleted sucessfully", data: product }
    else
      render json: { status: 'ERROR', message: "can not delete product", data: product.errors}
    end
  end
  
  private
    def product_params
      params.require(:product).permit(:name, :deescription, :price, :discount_price, :tax, :final_value, :product_category_id, :status)
    end
end


