require 'rails_helper'

RSpec.describe Order, type: :model do

  before do
    @role = Role.create(id: 1, title: "User")
    @user = User.create(id: 1, email: "abc@gmail.com", password: "123456789", role_id: @role.id)
    @user_address = UserAddress.create(id: 1, address: "home", city: "Pune", pincode: 123456, state: "MH", country: "In", 
    phn_no: 9867542301, residencial_phn_no: 7689234512, user_id: @user.id)
    @order = Order.create(id:1, tracking_number: 123456, order_placed_date: 13/06/2021, user_id: @user.id, user_address_id: @user_address.id, status: "placed")
  end

  describe "validations" do
    it "should not create order" do
      @order.user_id = nil
      expect(@order).to_not be_valid  
    end
  end   
end
