class AddRetiredToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :retired, :boolean, default: false
  end
end
