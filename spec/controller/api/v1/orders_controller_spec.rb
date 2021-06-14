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
      byebug
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
    
  end
  

end
