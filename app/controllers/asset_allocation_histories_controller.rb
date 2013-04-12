class AssetAllocationHistoriesController < ApplicationController
  # GET /asset_allocation_histories
  # GET /asset_allocation_histories.json
  def index
    @asset_allocation_histories = AssetAllocationHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asset_allocation_histories }
    end
  end

  # GET /asset_allocation_histories/1
  # GET /asset_allocation_histories/1.json
  def show
    @asset_allocation_history = AssetAllocationHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset_allocation_history }
    end
  end

  # GET /asset_allocation_histories/new
  # GET /asset_allocation_histories/new.json
  def new
    @asset_allocation_history = AssetAllocationHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asset_allocation_history }
    end
  end

  # GET /asset_allocation_histories/1/edit
  def edit
    @asset_allocation_history = AssetAllocationHistory.find(params[:id])
  end

  # POST /asset_allocation_histories
  # POST /asset_allocation_histories.json
  def create
    
    @asset_allocation_history = AssetAllocationHistory.new(params[:asset_allocation_history])
    
    assetAssignment = AssetAssignment.find_by_asset_id(@asset_allocation_history.asset_id)
    
    @asset_allocation_history.asset_id = assetAssignment.asset_id
    @asset_allocation_history.assigned_date = assetAssignment.assigned_date
    @asset_allocation_history.assignee_name = assetAssignment.assignee_name
    @asset_allocation_history.assignee_id = assetAssignment.assignee_id
    
    begin
      assetAssignment.destroy
    rescue
    end

    respond_to do |format|
      if @asset_allocation_history.save
        format.js {render :js => "assetRetainmentSuccess()"}
        format.html { redirect_to @asset_allocation_history, notice: 'Asset allocation history was successfully created.' }
        format.json { render json: @asset_allocation_history, status: :created, location: @asset_allocation_history }
      else
        format.js {render action:"retainment_error"}
        format.html { render action: "new" }
        format.json { render json: @asset_allocation_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /asset_allocation_histories/1
  # PUT /asset_allocation_histories/1.json
  def update
    @asset_allocation_history = AssetAllocationHistory.find(params[:id])

    respond_to do |format|
      if @asset_allocation_history.update_attributes(params[:asset_allocation_history])
        format.html { redirect_to @asset_allocation_history, notice: 'Asset allocation history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asset_allocation_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_allocation_histories/1
  # DELETE /asset_allocation_histories/1.json
  def destroy
    @asset_allocation_history = AssetAllocationHistory.find(params[:id])
    @asset_allocation_history.destroy

    respond_to do |format|
      format.html { redirect_to asset_allocation_histories_url }
      format.json { head :no_content }
    end
  end
end
