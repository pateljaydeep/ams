class AssetImport
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file

  def initialize(attributes = {})
    attributes.each{ |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_assets.map(&:valid?).all?
      imported_assets.each(&:save!)
      true
    else
      imported_assets.each_with_index do |asset, index|
        asset.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end


  def imported_assets
    @imported_assets ||= load_imported_assets
  end

  def load_imported_assets
    spreadsheet =  open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      asset = Asset.find_by_id(row["id"]) || Asset.new
      asset.attributes = row.to_hash.slice(*Asset.accessible_attributes)
      
      asset.asset_documents = '' if asset.asset_documents.nil?
      asset.asset_image = '' if asset.asset_image.nil?
      asset.retired = '0' if asset.retired.nil?

      asset
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end




