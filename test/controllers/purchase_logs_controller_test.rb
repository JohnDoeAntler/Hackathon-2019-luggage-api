require 'test_helper'

class PurchaseLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_log = purchase_logs(:one)
  end

  test "should get index" do
    get purchase_logs_url, as: :json
    assert_response :success
  end

  test "should create purchase_log" do
    assert_difference('PurchaseLog.count') do
      post purchase_logs_url, params: { purchase_log: { space_increasement: @purchase_log.space_increasement, store_id: @purchase_log.store_id, user_id: @purchase_log.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show purchase_log" do
    get purchase_log_url(@purchase_log), as: :json
    assert_response :success
  end

  test "should update purchase_log" do
    patch purchase_log_url(@purchase_log), params: { purchase_log: { space_increasement: @purchase_log.space_increasement, store_id: @purchase_log.store_id, user_id: @purchase_log.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy purchase_log" do
    assert_difference('PurchaseLog.count', -1) do
      delete purchase_log_url(@purchase_log), as: :json
    end

    assert_response 204
  end
end
