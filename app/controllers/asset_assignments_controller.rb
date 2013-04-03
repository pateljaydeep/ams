class AssetAssignmentsController < ApplicationController
  # GET /asset_assignments
  # GET /asset_assignments.json
  def index
    @asset_assignments = AssetAssignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asset_assignments }
    end
  end

  # GET /asset_assignments/1
  # GET /asset_assignments/1.json
  def show
    @asset_assignment = AssetAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset_assignment }
    end
  end

  # GET /asset_assignments/new
  # GET /asset_assignments/new.json
  def new
    @asset_assignment = AssetAssignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asset_assignment }
    end
  end

  # GET /asset_assignments/1/edit
  def edit
    @asset_assignment = AssetAssignment.find(params[:id])
  end

  # POST /asset_assignments
  # POST /asset_assignments.json
  def create
    @asset_assignment = AssetAssignment.new(params[:asset_assignment])

    respond_to do |format|
      if @asset_assignment.save
        format.html { redirect_to @asset_assignment, notice: 'Asset assignment was successfully created.' }
        format.json { render json: @asset_assignment, status: :created, location: @asset_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @asset_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /asset_assignments/1
  # PUT /asset_assignments/1.json
  def update
    @asset_assignment = AssetAssignment.find(params[:id])

    respond_to do |format|
      if @asset_assignment.update_attributes(params[:asset_assignment])
        format.html { redirect_to @asset_assignment, notice: 'Asset assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asset_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_assignments/1
  # DELETE /asset_assignments/1.json
  def destroy
    @asset_assignment = AssetAssignment.find(params[:id])
    @asset_assignment.destroy

    respond_to do |format|
      format.html { redirect_to asset_assignments_url }
      format.json { head :no_content }
    end
  end
end
