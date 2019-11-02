require 'test_helper'

class AirplaneClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @airplane_class = airplane_classes(:one)
  end

  test "should get index" do
    get airplane_classes_url, as: :json
    assert_response :success
  end

  test "should create airplane_class" do
    assert_difference('AirplaneClass.count') do
      post airplane_classes_url, params: { airplane_class: { airplane_id: @airplane_class.airplane_id, class: @airplane_class.class, distributed_space_percentage: @airplane_class.distributed_space_percentage, purchasable_space_percentage: @airplane_class.purchasable_space_percentage, space_amount: @airplane_class.space_amount, space_height: @airplane_class.space_height, space_length: @airplane_class.space_length, space_width: @airplane_class.space_width } }, as: :json
    end

    assert_response 201
  end

  test "should show airplane_class" do
    get airplane_class_url(@airplane_class), as: :json
    assert_response :success
  end

  test "should update airplane_class" do
    patch airplane_class_url(@airplane_class), params: { airplane_class: { airplane_id: @airplane_class.airplane_id, class: @airplane_class.class, distributed_space_percentage: @airplane_class.distributed_space_percentage, purchasable_space_percentage: @airplane_class.purchasable_space_percentage, space_amount: @airplane_class.space_amount, space_height: @airplane_class.space_height, space_length: @airplane_class.space_length, space_width: @airplane_class.space_width } }, as: :json
    assert_response 200
  end

  test "should destroy airplane_class" do
    assert_difference('AirplaneClass.count', -1) do
      delete airplane_class_url(@airplane_class), as: :json
    end

    assert_response 204
  end
end
