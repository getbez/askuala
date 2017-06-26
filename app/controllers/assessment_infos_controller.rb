class AssessmentInfosController < ApplicationController
before_action :set_assessment_info, only: [:show, :edit, :update, :destroy]

# GET /assessment_infos
# GET /assessment_infos.json
def index
  @assessment_infos = assessment_info.all
end

# GET /assessment_infos/1
# GET /assessment_infos/1.json
def show
end

# GET /assessment_infos/new
def new
  @assessment_info = assessment_info.new
  @assessment = Assessment.find(params[:assessment_id])
  @assessment_info.assessment_id = assessment.id

  LearnedConcept.where([concept_id: @assessment.target_concept,student_user_id: current_user.id])

  @assessment_info.learned_concept_id = params[:lc_id]
end

# GET /assessment_infos/1/edit
def edit
end

# POST /assessment_infos
# POST /assessment_infos.json
def create
  @assessment_info = assessment_info.new(assessment_info_params)

  respond_to do |format|
    if @assessment_info.save
      format.html { redirect_to edit_concept_url(@assessment_info.concept_id), notice: 'assessment_info was successfully created.' }
      format.json { render :show, status: :created, location: @assessment_info }
    else
      format.html { render :new }
      format.json { render json: @assessment_info.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /assessment_infos/1
# PATCH/PUT /assessment_infos/1.json
def update
  respond_to do |format|
    if @assessment_info.update(assessment_info_params)
      format.html { redirect_to edit_concept_url(@assessment_info.concept_id), notice: 'assessment_info was successfully updated.' }
      format.json { render :show, status: :ok, location: @assessment_info }
    else
      format.html { render :edit }
      format.json { render json: @assessment_info.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /assessment_infos/1
# DELETE /assessment_infos/1.json
def destroy
  @assessment_info.destroy
  respond_to do |format|
    format.html { redirect_to edit_concept_url(@assessment_info.concept_id), notice: 'assessment_info was successfully destroyed.' }
    format.json { head :no_content }
  end
end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_assessment_info
    @assessment_info = assessment_info.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def assessment_info_params
    params.require(:assessment_info).permit(:level, :min_passing_grade, :concept_id)
  end
end
