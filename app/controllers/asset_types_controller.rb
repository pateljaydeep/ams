class AssetTypesController < ApplicationController
  # GET /asset_types
  # GET /asset_types.json
  def index
    @asset_types = AssetType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asset_types }
    end
  end
  
  # GET /asset_type/1/assets
  # GET /asset_type/1/assets.json
  def assets
    page "asset"
    begin
      @asset_type = AssetType.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to find asset by invalid asset type #{params[:id]} failed."
      redirect_to root_url, notice: 'Asset type does not exists.'
    else
      respond_to do |format|
        @assets = Asset.includes(:asset_type, :asset_assignment)
          .where("asset_type_id = ?", params[:id])
          .paginate(:page => params[:page])
        @employees = getEmployeesInfoMap
        format.html
        format.json { render json: @assets }
      end
    end
  end

  # GET /asset_types/1
  # GET /asset_types/1.json
  def show
    @asset_type = AssetType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset_type }
    end
  end

  # GET /asset_types/new
  # GET /asset_types/new.json
  def new
    @asset_type = AssetType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asset_type }
    end
  end

  # GET /asset_types/1/edit
  def edit
    @asset_type = AssetType.find(params[:id])
  end

  # POST /asset_types
  # POST /asset_types.json
  def create
    @asset_type = AssetType.new(params[:asset_type])

    respond_to do |format|
      if @asset_type.save
        format.html { redirect_to @asset_type, notice: 'Asset type was successfully created.' }
        format.json { render json: @asset_type, status: :created, location: @asset_type }
      else
        format.html { render action: "new" }
        format.json { render json: @asset_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /asset_types/1
  # PUT /asset_types/1.json
  def update
    @asset_type = AssetType.find(params[:id])

    respond_to do |format|
      if @asset_type.update_attributes(params[:asset_type])
        format.html { redirect_to @asset_type, notice: 'Asset type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asset_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_types/1
  # DELETE /asset_types/1.json
  def destroy
    @asset_type = AssetType.find(params[:id])
    @asset_type.destroy

    respond_to do |format|
      format.html { redirect_to asset_types_url }
      format.json { head :no_content }
    end
  end
end
