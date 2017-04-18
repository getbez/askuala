class ConceptResourcesController < ApplicationController
  before_action :set_concept_resource, only: [:show, :edit, :update, :destroy]

  # GET /concept_resources
  # GET /concept_resources.json
  def index
    @concept_resources = ConceptResource.all
  end

  # GET /concept_resources/1
  # GET /concept_resources/1.json
  def show
    send_data(@concept_resource.resource,
              content_type: @concept_resource.resource_content_type,
              file_name: @concept_resource.resource_file_name,disposition: 'inline')
  end

  # GET /concept_resources/new
  def new
    @concept_resource = ConceptResource.new
    @concept_resource.concept_id = params[:concept_id]
  end

  # GET /concept_resources/1/edit
  def edit
  end

  # POST /concept_resources
  # POST /concept_resources.json
  def create
   
    @concept_resource = ConceptResource.new(concept_resource_params)
    @concept_resource.concept_id = params[:concept_id]
    respond_to do |format|
      if @concept_resource.save
        format.html { redirect_to edit_concept_path(params[:concept_id]), notice: 'Concept resource was successfully created.' }
        format.json { render :show, status: :created, location: @concept_resource }
      else
        format.html { render :new }
        format.json { render json: @concept_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concept_resources/1
  # PATCH/PUT /concept_resources/1.json
  def update
    respond_to do |format|
      if @concept_resource.update(concept_resource_params)
        format.html { redirect_to @concept_resource, notice: 'Concept resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @concept_resource }
      else
        format.html { render :edit }
        format.json { render json: @concept_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concept_resources/1
  # DELETE /concept_resources/1.json
  def destroy
    concept_id = @concept_resource.concept_id
    @concept_resource.destroy
    respond_to do |format|
      format.html { redirect_to edit_concept_path(concept_id), notice: 'Concept resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concept_resource
      @concept_resource = ConceptResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concept_resource_params
      params.require(:concept_resource).permit(:resource,:presentation_mode, :resource_type, :concept_id)
    end
end
