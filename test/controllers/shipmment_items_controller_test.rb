require "test_helper"

class ShipmmentItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipmment_item = shipmment_items(:one)
  end

  test "should get index" do
    get shipmment_items_url
    assert_response :success
  end

  test "should get new" do
    get new_shipmment_item_url
    assert_response :success
  end

  test "should create shipmment_item" do
    assert_difference('ShipmmentItem.count') do
      post shipmment_items_url, params: { shipmment_item: { order_item_id: @shipmment_item.order_item_id, shipment_id: @shipmment_item.shipment_id, status: @shipmment_item.status } }
    end

    assert_redirected_to shipmment_item_url(ShipmmentItem.last)
  end

  test "should show shipmment_item" do
    get shipmment_item_url(@shipmment_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipmment_item_url(@shipmment_item)
    assert_response :success
  end

  test "should update shipmment_item" do
    patch shipmment_item_url(@shipmment_item), params: { shipmment_item: { order_item_id: @shipmment_item.order_item_id, shipment_id: @shipmment_item.shipment_id, status: @shipmment_item.status } }
    assert_redirected_to shipmment_item_url(@shipmment_item)
  end

  test "should destroy shipmment_item" do
    assert_difference('ShipmmentItem.count', -1) do
      delete shipmment_item_url(@shipmment_item)
    end

    assert_redirected_to shipmment_items_url
  end
end
