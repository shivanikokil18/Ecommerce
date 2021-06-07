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
      get '/api/v1/products'
    end 
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    
    it "return JSON with product attributes" do 
      #return the response body of API request as a string in JSON format
      json_response = JSON.parse(response.body)
      keys_array = json_response[0].keys.map {|key| key.to_sym}
      expect(keys_array).to match_array([:id, :name, :deescription, :price, :discount_price, :tax, :final_value, :product_category_id, :status])  
    end
  end     
end
