require 'test_helper'

class AssetAllocationHistoriesControllerTest < ActionController::TestCase
  setup do
    @asset_allocation_history = asset_allocation_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_allocation_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset_allocation_history" do
    assert_difference('AssetAllocationHistory.count') do
      post :create, asset_allocation_history: { asset_id: @asset_allocation_history.asset_id, assigned_date: @asset_allocation_history.assigned_date, assignee_id: @asset_allocation_history.assignee_id, assignee_name: @asset_allocation_history.assignee_name, returned_date: @asset_allocation_history.returned_date }
    end

    assert_redirected_to asset_allocation_history_path(assigns(:asset_allocation_history))
  end

  test "should show asset_allocation_history" do
    get :show, id: @asset_allocation_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset_allocation_history
    assert_response :success
  end

  test "should update asset_allocation_history" do
    put :update, id: @asset_allocation_history, asset_allocation_history: { asset_id: @asset_allocation_history.asset_id, assigned_date: @asset_allocation_history.assigned_date, assignee_id: @asset_allocation_history.assignee_id, assignee_name: @asset_allocation_history.assignee_name, returned_date: @asset_allocation_history.returned_date }
    assert_redirected_to asset_allocation_history_path(assigns(:asset_allocation_history))
  end

  test "should destroy asset_allocation_history" do
    assert_difference('AssetAllocationHistory.count', -1) do
      delete :destroy, id: @asset_allocation_history
    end

    assert_redirected_to asset_allocation_histories_path
  end
end
