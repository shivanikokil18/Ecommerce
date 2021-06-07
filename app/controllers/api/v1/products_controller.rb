class Api::V1::ProductsController < ApiController
  def index
    products = Product.all.as_json(except: [:created_at, :updated_at])
    render json: products, status: :ok
  end

  def show
    product = Product.find(params[:id])
    render json: product 
  end

  def create
    product = Product.create(product_params)
    render json: product
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    render json: product
  end

  def destroy
    product = Product.all
    product = Product.find(params[:id])
    product.destroy
    render json: product
  end
  
  private
    def product_params
      params.permit(:name, :deescription, :price, :discount_price, :tax, :final_value, :product_category_id, :status)
    end
end
