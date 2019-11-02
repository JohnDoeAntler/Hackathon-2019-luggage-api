require 'test_helper'

class LuggagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @luggage = luggages(:one)
  end

  test "should get index" do
    get luggages_url, as: :json
    assert_response :success
  end

  test "should create luggage" do
    assert_difference('Luggage.count') do
      post luggages_url, params: { luggage: { height: @luggage.height, image_url: @luggage.image_url, length: @luggage.length, space_index: @luggage.space_index, user_id: @luggage.user_id, width: @luggage.width } }, as: :json
    end

    assert_response 201
  end

  test "should show luggage" do
    get luggage_url(@luggage), as: :json
    assert_response :success
  end

  test "should update luggage" do
    patch luggage_url(@luggage), params: { luggage: { height: @luggage.height, image_url: @luggage.image_url, length: @luggage.length, space_index: @luggage.space_index, user_id: @luggage.user_id, width: @luggage.width } }, as: :json
    assert_response 200
  end

  test "should destroy luggage" do
    assert_difference('Luggage.count', -1) do
      delete luggage_url(@luggage), as: :json
    end

    assert_response 204
  end
end
