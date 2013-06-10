class RemoveMakeYearFromAssets < ActiveRecord::Migration
  def up
    remove_column :assets, :make_year
  end

  def down
    add_column :assets, :make_year, :integer
  end
end
