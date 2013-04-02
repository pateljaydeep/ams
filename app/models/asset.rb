class Asset < ActiveRecord::Base
  attr_accessible :asset_documents, :asset_id, :asset_type_id, :asset_image, :description, :display_size, :make_year, :manufacturer, :model, :operating_system, :purchase_date, :release_date, :serial_number
  validates :asset_id, :presence => true;
  validates :purchase_date, :presence => true;
  validates :serial_number, :presence => true;
  validates :make_year, :presence => true;
  belongs_to :asset_type
  has_many :asset_assignments
  
  before_destroy :ensure_no_assignment
  
  private
    def ensure_no_assignment
      assignment = AssetAssignment.find_by_asset_id_and_returned_date(self.id,nil)
      errors.add(:base, "Cannot be deleted.   The asset is currently assigned to #{assignment.assignee_name}") unless assignment == nil
      return false
    end
end
