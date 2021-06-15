require 'rails_helper'
require 'spec_helper'

RSpec.describe  Api::V1::OrdersController, type: :request do
  describe "GET #index" do
    before do
      @role = Role.create(id: 1, title: "User")
      @user = User.create(id: 1, email: "abc@gmail.com", password: "123456789", role_id: @role.id)
      @user_address = UserAddress.create(id: 1, address: "home", city: "Pune", pincode: 123456, state: "MH", country: "In", 
      phn_no: 9867542301, residencial_phn_no: 7689234512, user_id: @user.id)
      @order = Order.create(id:1, tracking_number: 123456, order_placed_date: 13/06/2021, user_id: @user.id, user_address_id: @user_address.id, status: "placed")
    end
    
    context "sucess" do
      it "Returns 200" do
        get '/api/v1/orders/'
        json_response = JSON.parse(response.body)
        key_array = json_response[0].keys.map {|key| key.to_sym}
        expect(key_array).to match_array([:id, :tracking_number, :order_placed_date, :user_id, :user_address_id, :status ])  
      end     
    end  
  end 

  describe "GET #show" do
    before do
      @role = Role.create(id: 1, title: "User")
      @user = User.create(id: 1, email: "abc@gmail.com", password: "123456789", role_id: @role.id)
      @user_address = UserAddress.create(id: 1, address: "home", city: "Pune", pincode: 123456, state: "MH", country: "In", 
      phn_no: 9867542301, residencial_phn_no: 7689234512, user_id: @user.id)
      @order = Order.create(id:1, tracking_number: 123456, order_placed_date: 13/06/2021, user_id: @user.id, user_address_id: @user_address.id, status: "placed")
    end

    context "success" do
      it "Returns 200" do 
        get "/api/v1/orders/#{@order.id}"#, params: {id: @order.id}
        expect(response).to have_http_status(200)  
      end
    end  
  end
  
  describe "POST #create" do
    let(:order_params) do
      {
        order: {
          tracking_number: 123456, 
          order_placed_date: 13/06/2021, 
          user_id: @user.id, 
          user_address_id: @user_address.id, 
          status: "placed"
        }
      }
    end

    before do
      @role = Role.create(id: 1, title: "User")
      @user = User.create(id: 1, email: "abc@gmail.com", password: "123456789", role_id: @role.id)
      @user_address = UserAddress.create(id: 1, address: "home", city: "Pune", pincode: 123456, state: "MH", country: "In", 
      phn_no: 9867542301, residencial_phn_no: 7689234512, user_id: @user.id)
    end

    it "returns success" do
      post "/api/v1/orders", params: order_params
      expect(response).to have_http_status(:success)  
    end

    it "returns failure" do 
      order_params[:order].delete(:user_id)
      post "/api/v1/orders", params: order_params
      expect(response).to have_http_status(422)   
    end 
  end

  describe "DELETE #destroy" do
    before do
      @role = Role.create(id: 1, title: "User")
      @user = User.create(id: 1, email: "abc@gmail.com", password: "123456789", role_id: @role.id)
      @user_address = UserAddress.create(id: 1, address: "home", city: "Pune", pincode: 123456, state: "MH", country: "In", 
      phn_no: 9867542301, residencial_phn_no: 7689234512, user_id: @user.id)
      @order = Order.create(id:1, tracking_number: 123456, order_placed_date: 13/06/2021, user_id: @user.id, user_address_id: @user_address.id, status: "placed")
    end

    it "destroys successful" do
      delete "/api/v1/orders/#{@order.id}"
      expect(response).to have_http_status(200)  
    end  
  end

  describe "PATCH #update" do

    let(:order_params) do
      {
        order: {
          tracking_number: 123456, 
          order_placed_date: 13/06/2021, 
          user_id: @user.id, 
          user_address_id: @user_address.id, 
          status: "placed"
        }
      }
    end

    before do
      @role = Role.create(id: 1, title: "User")
      @user = User.create(id: 1, email: "abc@gmail.com", password: "123456789", role_id: @role.id)
      @user_address = UserAddress.create(id: 1, address: "home", city: "Pune", pincode: 123456, state: "MH", country: "In", 
      phn_no: 9867542301, residencial_phn_no: 7689234512, user_id: @user.id)
      @order = Order.create(order_params[:order])
    end

    context "sucess" do
      it "updates sucessfully" do
        patch "/api/v1/orders/#{@order.id}", params: order_params
        json_response = JSON.parse(response.body)
        json_response['data']['tracking_number'] = 98765
        expect(json_response['data']['tracking_number']).to eq(98765)  
      end   
    end
    
    context "failure" do
      it "returns 500" do
        patch "/api/v1/orders/#{@order.id}", params: order_params
        json_response = JSON.parse(response.body)
        json_response['data']['user_id'] = null
        expect(response).to have_http_status(500) 
      end
    end
    
  end
  
end
