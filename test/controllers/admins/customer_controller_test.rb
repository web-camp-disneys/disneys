require 'test_helper'

class Admins::CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_customer_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_customer_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_customer_edit_url
    assert_response :success
  end

end
