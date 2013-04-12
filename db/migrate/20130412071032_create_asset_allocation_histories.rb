class CreateAssetAllocationHistories < ActiveRecord::Migration
  def change
    create_table :asset_allocation_histories do |t|
      t.string :assignee_id
      t.string :assignee_name
      t.date :assigned_date
      t.date :returned_date
      t.integer :asset_id

      t.timestamps
    end
  end
end
