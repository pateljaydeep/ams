module HomeHelper
  def find_asset_type(name, asset_types)
    index = asset_types.find_index { |asset_type| asset_type.name == name}
    asset_types[index]
  end
end
