class AssetAllocationHistory < ActiveRecord::Base
  attr_accessible :asset_id, :assigned_date, :assignee_id, :assignee_name, :returned_date
  
  attr_reader :exceptionVar
  
  belongs_to :asset
  
  before_create :ensure_returned_date_after_assigned_date, :ensure_asset_not_assigned
  
  validates :asset_id, :presence => true
  validates :assigned_date, :presence => true
  validates :returned_date, :presence => true
  validates :assignee_id, :presence => true
  validates :assignee_name, :presence => true
  
  def logAllocationHistory
    begin
      AssetAllocationHistory.transaction do
        assetAssignment = AssetAssignment.find_by_asset_id(self.asset_id)
        
        self.asset_id = assetAssignment.asset_id
        self.assigned_date = assetAssignment.assigned_date
        self.assignee_name = assetAssignment.assignee_name
        self.assignee_id = assetAssignment.assignee_id
        
        assetAssignment.destroy
        
        self.save!
      end
    rescue
      return false
    end    
  end
  
  private
  
    def ensure_asset_not_assigned
      assetAssmt = nil
      begin
        assetAssmt = AssetAssignment.find_by_asset_id(self.asset_id)
      rescue
      end
      if assetAssmt != nil
        errors.add(:asset_id, " is still assigned")
        return false
      end      
    end
      
    def ensure_returned_date_after_assigned_date
      if self.assigned_date > self.returned_date
        errors.add(:returned_date, "must be after Assigned Date")
        return false
      end
    end
  
end
