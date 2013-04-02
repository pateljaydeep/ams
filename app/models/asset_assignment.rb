class AssetAssignment < ActiveRecord::Base
  attr_accessible :asset_id, :assigned_date, :assignee_id, :assignee_name, :returned_date
  
  belongs_to :asset
  
  before_create :ensure_asset_not_yet_assigned
  
  validates :asset_id, :presence => true
  validates :assigned_date, :presence => true
  validates :assignee_id, :presence => true
  validates :assignee_name, :presence => true
  
  validate :assigned_date_must_be_before_returned_date
  
  validate :ensure_asset_availability
  
  private
  
    def ensure_asset_not_yet_assigned
      errors.add(:asset_id, " is already assigned") unless AssetAssignment.find_by_asset_id_and_returned_date(self.asset_id,nil) == nil
      return false
    end
      
    def assigned_date_must_be_before_returned_date
      return if self.returned_date == nil
      errors.add(:returned_date, "must be after Assigned Date") unless self.assigned_date <= self.returned_date
    end
    
    def ensure_asset_availability
      begin
        @asset = Asset.find(self.asset_id)
      rescue
        errors.add(:asset_id, "not found")
      end
      return
    end
  
end
