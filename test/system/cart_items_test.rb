require "application_system_test_case"

class CartItemsTest < ApplicationSystemTestCase
  setup do
    @cart_item = cart_items(:one)
  end

  test "visiting the index" do
    visit cart_items_url
    assert_selector "h1", text: "Cart Items"
  end

  test "creating a Cart item" do
    visit cart_items_url
    click_on "New Cart Item"

    fill_in "Base price", with: @cart_item.base_price
    fill_in "Cart", with: @cart_item.cart_id
    fill_in "Discount", with: @cart_item.discount
    fill_in "Product", with: @cart_item.product_id
    fill_in "Tax", with: @cart_item.tax
    fill_in "Total price", with: @cart_item.total_price
    click_on "Create Cart item"

    assert_text "Cart item was successfully created"
    click_on "Back"
  end

  test "updating a Cart item" do
    visit cart_items_url
    click_on "Edit", match: :first

    fill_in "Base price", with: @cart_item.base_price
    fill_in "Cart", with: @cart_item.cart_id
    fill_in "Discount", with: @cart_item.discount
    fill_in "Product", with: @cart_item.product_id
    fill_in "Tax", with: @cart_item.tax
    fill_in "Total price", with: @cart_item.total_price
    click_on "Update Cart item"

    assert_text "Cart item was successfully updated"
    click_on "Back"
  end

  test "destroying a Cart item" do
    visit cart_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cart item was successfully destroyed"
  end
end
