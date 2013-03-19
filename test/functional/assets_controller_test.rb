require 'test_helper'

class AssetsControllerTest < ActionController::TestCase
  setup do
    @asset = assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset" do
    assert_difference('Asset.count') do
      post :create, asset: { asset_documents: @asset.asset_documents, asset_id: @asset.asset_id, asset_image: @asset.asset_image, asset_type_id: @asset.asset_type_id, description: @asset.description, display_size: @asset.display_size, make_year: @asset.make_year, manufacturer: @asset.manufacturer, model: @asset.model, operating_system: @asset.operating_system, purchase_date: @asset.purchase_date, release_date: @asset.release_date, serial_number: @asset.serial_number }
    end

    assert_redirected_to asset_path(assigns(:asset))
  end

  test "should show asset" do
    get :show, id: @asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset
    assert_response :success
  end

  test "should update asset" do
    put :update, id: @asset, asset: { asset_documents: @asset.asset_documents, asset_id: @asset.asset_id, asset_image: @asset.asset_image, asset_type_id: @asset.asset_type_id, description: @asset.description, display_size: @asset.display_size, make_year: @asset.make_year, manufacturer: @asset.manufacturer, model: @asset.model, operating_system: @asset.operating_system, purchase_date: @asset.purchase_date, release_date: @asset.release_date, serial_number: @asset.serial_number }
    assert_redirected_to asset_path(assigns(:asset))
  end

  test "should destroy asset" do
    assert_difference('Asset.count', -1) do
      delete :destroy, id: @asset
    end

    assert_redirected_to assets_path
  end
end
