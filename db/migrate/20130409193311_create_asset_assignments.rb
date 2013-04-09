class CreateAssetAssignments < ActiveRecord::Migration
  def change
    create_table :asset_assignments do |t|
      t.string :assignee_id
      t.string :assignee_name
      t.date :assigned_date
      t.integer :asset_id

      t.timestamps
    end
  end
end
