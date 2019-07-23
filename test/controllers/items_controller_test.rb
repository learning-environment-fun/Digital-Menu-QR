require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get orders" do
    get items_orders_url
    assert_response :success
  end

  test "should get restaurants" do
    get items_restaurants_url
    assert_response :success
  end

end
