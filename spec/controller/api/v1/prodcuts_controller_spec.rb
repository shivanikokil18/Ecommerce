require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::ProductsController, type: :request do
  describe "GET #index" do
    before do
      product_category = ProductCategory.create(id: 1, name: 'pqr')
      
      product = Product.create(
        id: 1,
        name: 'abc',
        deescription: 'abcd',
        price: 100,
        discount_price: 70,
        tax: 10,
        final_value: 80,
        product_category_id: 1,
        status: 3  
      )

      product = Product.create(
        id: 2,
        name: 'abc',
        deescription: 'abcd',
        price: 100,
        discount_price: 70,
        tax: 10,
        final_value: 80,
        product_category_id: 1,
        status: 3  
      )
      get '/api/v1/products'
    end 
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    
    # it "return JSON with product attributes" do 
    #   #return the response body of API request as a string in JSON format
    #   json_response = JSON.parse(response.body)
    #   key_array = json_response[0].keys.map {|key| key.to_sym}
    #   expect(key_array).to match_array([:id, :name, :deescription, :price, :discount_price, :tax, :final_value, :product_category_id, :status])  
    # end

    it 'should get all proudcts' do
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(3)
    end
  end 

  # describe "#show" do
  #   context "sucessfully viewed" do
  #     product_category = ProductCategory.create(id: 3, name: 'pqr')
      
  #     product = Product.create(
  #       id: 4,
  #       name: 'abc',
  #       deescription: 'abcd',
  #       price: 100,
  #       discount_price: 70,
  #       tax: 10,
  #       final_value: 80,
  #       product_category_id: 2,
  #       status: 3  
  #     )

  #     let(:product_params) do
  #       {
  #         id: product.id
  #       }
  #     end
  #   end
    
  #   it 'Return sucess' do
  #     get '/api/v1/products', params: product_params
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  
  
  # describe "POST #create" do
  #   let(:product_category_params) do 
  #     {
  #       product_category:{
  #         'id' => 1, 
  #         'name' => 'pqr'
  #       }
  #     }
  #   end

  #   let(:product_params) do
  #     {
  #       product: {
  #         id: 2, name: 'abcd', deescription: 'nice', price: 100, discount_price: 70, tax: 10, final_value: 80, product_category_id: 1, status: 3 
  #       }
  #     }
  #   end

  #   context 'success' do
  #     it 'returns 200' do
  #       post '/api/v1/products', params: product_params
  #       expect(response).to have_http_status(:success)
  #     end
  #   end

  #   context "failure" do
  #     before { product_params[:product].delete(:name) }
  #     it 'has missing parameter' do
  #       post '/api/v1/products', params: product_params
  #       expect(response).to have_http_status(:error)
  #     end
  #   end
  # end
end
