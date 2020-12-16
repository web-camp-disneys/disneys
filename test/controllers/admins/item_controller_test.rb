require 'test_helper'

class Admins::ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_item_new_url
    assert_response :success
  end

  test "should get show" do
    get admins_item_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_item_edit_url
    assert_response :success
  end

end
