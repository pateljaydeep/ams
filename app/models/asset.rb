class Asset < ActiveRecord::Base
  attr_accessible :asset_documents, :asset_id, :asset_type_id, :asset_image, :description, :display_size, :make_year, :manufacturer, :model, :operating_system, :purchase_date, :release_date, :serial_number
  
  belongs_to :asset_type
end
