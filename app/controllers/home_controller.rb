class HomeController < ApplicationController
  def index
    page "home"
    @asset_types = AssetType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asset_types }
    end
  end
end
