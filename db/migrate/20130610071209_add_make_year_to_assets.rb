class AddMakeYearToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :make_year, :date
  end
end
