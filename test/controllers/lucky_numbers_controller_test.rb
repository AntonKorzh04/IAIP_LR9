require "test_helper"
require 'json'

class LuckyNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get lucky_numbers_input_url
    assert_response :success
  end

  test "should get view" do
    get lucky_numbers_view_url
    assert_response :success
  end

  test "should get JSON for view with 2000" do
    # json, получаемый при запросе с параметрами {numbers_count: "2000"}
    expected_json = {"0":"000000","1":"001001","2":"001010","3":"001100"}.to_json
    
    get lucky_numbers_view_url, params: {numbers_count: "2000"}, as: :json
    assert_response :success
    assert_equal expected_json, response.body
  end
end
