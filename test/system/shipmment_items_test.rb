require "application_system_test_case"

class ShipmmentItemsTest < ApplicationSystemTestCase
  setup do
    @shipmment_item = shipmment_items(:one)
  end

  test "visiting the index" do
    visit shipmment_items_url
    assert_selector "h1", text: "Shipmment Items"
  end

  test "creating a Shipmment item" do
    visit shipmment_items_url
    click_on "New Shipmment Item"

    fill_in "Order item", with: @shipmment_item.order_item_id
    fill_in "Shipment", with: @shipmment_item.shipment_id
    fill_in "Status", with: @shipmment_item.status
    click_on "Create Shipmment item"

    assert_text "Shipmment item was successfully created"
    click_on "Back"
  end

  test "updating a Shipmment item" do
    visit shipmment_items_url
    click_on "Edit", match: :first

    fill_in "Order item", with: @shipmment_item.order_item_id
    fill_in "Shipment", with: @shipmment_item.shipment_id
    fill_in "Status", with: @shipmment_item.status
    click_on "Update Shipmment item"

    assert_text "Shipmment item was successfully updated"
    click_on "Back"
  end

  test "destroying a Shipmment item" do
    visit shipmment_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shipmment item was successfully destroyed"
  end
end
