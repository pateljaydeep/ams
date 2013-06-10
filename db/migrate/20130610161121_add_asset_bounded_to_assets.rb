class AddAssetBoundedToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :asset_bounded, :boolean, default: false
  end
end
