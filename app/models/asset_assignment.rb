class AssetAssignment < ActiveRecord::Base
  attr_accessible :asset_id, :assigned_date, :assignee_id, :assignee_name
  
  belongs_to :asset
  
  before_create :ensure_asset_not_yet_assigned
  
  validates :asset_id, :presence => true
  validates :assigned_date, :presence => true
  validates :assignee_id, :presence => true
  validates :assignee_name, :presence => true
  
  validate :ensure_asset_availability
  
  private
  
    def ensure_asset_not_yet_assigned
      assetAssmt = nil
      begin
        assetAssmt = AssetAssignment.find_by_asset_id(self.asset_id)
      rescue
      end
      if assetAssmt != nil
        errors.add(:asset_id, " is already assigned")
        return false
      end      
    end
      
    def ensure_asset_availability
      begin
        @asset = Asset.find(self.asset_id)
      rescue
        errors.add(:asset_id, "not found")
      end
    end
end
