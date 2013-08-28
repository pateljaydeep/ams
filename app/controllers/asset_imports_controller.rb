class AssetImportsController < ApplicationController

  def new
    @asset_import = AssetImport.new
  end

  def create
    @asset_import = AssetImport.new(params[:asset_import])
    if @asset_import.save
      redirect_to root_url, notice:"Imported assets successfully."
    else
      render :new
    end
  end

end
