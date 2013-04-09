class AssetAssignment < ActiveRecord::Base
  attr_accessible :asset_id, :assigned_date, :assignee_id, :assignee_name
end
