require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::ProductsController, type: :request do
  describe "GET #index" do
    before do
      @product_category = ProductCategory.create!(name: 'pqr')
      
      @product = Product.create!(
        name: 'abc',
        deescription: 'abcd',
        price: 100,
        discount_price: 70,
        tax: 10,
        final_value: 80,
        product_category_id: @product_category.id,
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
      key_array = json_response[0].keys.map {|key| key.to_sym}
      expect(key_array).to match_array([:id, :name, :deescription, :price, :discount_price, :tax, :final_value, :product_category_id, :status])  
    end

    it 'should get all proudcts' do
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(1)
    end
  end 

  describe "#show" do

    before do
      @product_category = ProductCategory.create!(name: 'pqr')
      
      @product = Product.create!(
        name: 'abc',
        deescription: 'abcd',
        price: 100,
        discount_price: 70,
        tax: 10,
        final_value: 80,
        product_category_id: @product_category.id,
        status: 3  
      )
    end
    context "sucess" do
      it 'Return sucess' do
        get "/api/v1/products/#{@product.id}", params: {id: @product.id}
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  
  describe "POST #create" do
    let(:product_category_params) do 
      {
        product_category:{
          name: 'pqr'
        }
      }
    end
    before do
      @product_category = ProductCategory.create!(product_category_params[:product_category])
    end
    let(:product_params) do
      {
        product: {
          name: 'abcd', deescription: 'nice', price: 100, discount_price: 70, tax: 10, final_value: 80,
          product_category_id: @product_category.id, status: "available"
        }
      }
    end    
    context 'success' do
      it 'returns 200' do
        post '/api/v1/products', params: product_params
        expect(response).to have_http_status(200)
      end
    end

    context "failure" do
      it 'has missing parameter' do
        product_params[:product].delete(:product_category_id)
        post '/api/v1/products', params: product_params
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PATCH #update" do
    let(:product_category_params) do 
      {
        product_category:{
          name: 'cloth'
        }
      }
    end

    before do
      @product_category = ProductCategory.create!(product_category_params[:product_category])
      @product = Product.create!(name: 'jacket', deescription: 'denim', price: 1000, discount_price: 700, tax: 10, final_value: 710,
        product_category_id: @product_category.id, status: "available")
    end
    let(:product_params) do 
      {
        id: @product.id,
        product:{
          name: name
        }
      }
    end
    
    context "success" do
      let(:name) { "shirt" } 
      it "returns 200" do
        patch  "/api/v1/products/#{@product.id}", params: product_params
        expect(@product.reload.name).to eq name
      end
    end    
    context "failure" do
      let(:name) { "" } 
      it "returns 200" do
        patch  "/api/v1/products/#{@product.id}", params: product_params
        expect(response).to have_http_status(422) 
      end
    end
    
  end

  describe "DELETE #destroy" do
    let(:product_category_params) do 
      {
        product_category:{
          name: 'cloth'
        }
      }
    end
    
    before do 
      @product_category = ProductCategory.create!(product_category_params[:product_category])
    end

    let(:product_params) do 
      {
        product:{
          name: 'jacket', deescription: 'denim', price: 1000, discount_price: 700, tax: 10, final_value: 710,
          product_category_id: @product_category.id, status: "available"
        }
      }
    end
    before do
      @product = Product.create!(product_params[:product])
    end

    context "success" do
      it "returns 200" do
        delete "/api/v1/products/#{@product.id}", params: {id: @product.id}
        expect(response).to have_http_status(200)  
        expect(Product.find_by(name: @product["jacket"])).to be_nil
      end      
    end
  end
end
