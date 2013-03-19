class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_id
      t.string :manufacturer
      t.integer :asset_type_id
      t.text :description
      t.date :purchase_date
      t.date :release_date
      t.string :asset_image
      t.string :asset_documents
      t.string :serial_number
      t.string :model
      t.integer :make_year
      t.string :display_size
      t.string :operating_system

      t.timestamps
    end
  end
end
