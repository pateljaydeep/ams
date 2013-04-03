require 'test_helper'

class AssetAssignmentsControllerTest < ActionController::TestCase
  setup do
    @asset_assignment = asset_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset_assignment" do
    assert_difference('AssetAssignment.count') do
      post :create, asset_assignment: { asset_id: @asset_assignment.asset_id, assigned_date: @asset_assignment.assigned_date, assignee_id: @asset_assignment.assignee_id, assignee_name: @asset_assignment.assignee_name, returned_date: @asset_assignment.returned_date }
    end

    assert_redirected_to asset_assignment_path(assigns(:asset_assignment))
  end

  test "should show asset_assignment" do
    get :show, id: @asset_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset_assignment
    assert_response :success
  end

  test "should update asset_assignment" do
    put :update, id: @asset_assignment, asset_assignment: { asset_id: @asset_assignment.asset_id, assigned_date: @asset_assignment.assigned_date, assignee_id: @asset_assignment.assignee_id, assignee_name: @asset_assignment.assignee_name, returned_date: @asset_assignment.returned_date }
    assert_redirected_to asset_assignment_path(assigns(:asset_assignment))
  end

  test "should destroy asset_assignment" do
    assert_difference('AssetAssignment.count', -1) do
      delete :destroy, id: @asset_assignment
    end

    assert_redirected_to asset_assignments_path
  end
end
