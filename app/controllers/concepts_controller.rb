class ConceptsController < ApplicationController
  before_action :set_concept, only: [:show, :edit, :update, :destroy]

  # GET /concepts
  # GET /concepts.json
  def index
    @concepts = Concept.all
  end

  # GET /concepts/1
  # GET /concepts/1.json
  def show
  end

  # GET /concepts/new
  def new
    @concept = Concept.new
    @concept.course_id = params[:course_id];
  end

  # GET /concepts/1/edit
  def edit
  end

  # POST /concepts
  # POST /concepts.json
  def create
    @concept = Concept.new(concept_params)
    if(@concept.prerequisites.nil? || @concept.prerequisites.size == 0)
      @concept.level = 1
    else
      @concept.level =  @concept.prerequisites.max_by(&:level).level+1
    end
    @concept.course_id = params[:course_id]
    @course = Course.find(@concept.course_id)

    respond_to do |format|
      if @concept.save
        format.html { redirect_to  edit_course_path(@course), notice: 'Concept was successfully created.' }
        format.json { render :show, status: :created, location:  @course }
      else
        format.html { render :new }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concepts/1
  # PATCH/PUT /concepts/1.json
  def update
    @course = Course.find(@concept.course_id)
    respond_to do |format|
      if @concept.update(concept_params)
        format.html { redirect_to edit_course_path(@course), notice: 'Concept was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concepts/1
  # DELETE /concepts/1.json
  def destroy
    @course = Course.find(@concept.course_id)
    @concept.destroy
    respond_to do |format|
      format.html { redirect_to edit_course_path(@course), notice: 'Concept was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def learn
    logger.debug("**********learn************")
   @learned_concept= LearnedConcept.new
   @concept=Concept.find(params[:id])
    learner_pref=LearnerPreference.where(:student_id=>current_user.id).first
    if learner_pref.nil?
      redirect_to new_preference_path
    else
      preference=Preference.find(learner_pref.preference_id)

      @learned_concept.learned_course_id=params[:lc_id]
      @learned_concept.start_time= Time.now
      @learned_concept.concept_id=@concept.id

      @concept_resource = ConceptResource.new
      @concept_resource=@concept.concept_resources.select{
          |cr| cr.presentation_mode == Preference.presentation_modes[preference.presentation_mode] &&
            cr.resource_type == Preference.resource_types[preference.resource_type]
      }.first
      if(@concept_resource.nil?)
        @learned_course=LearnedCourse.find(@learned_concept.learned_course_id)

        respond_to do |format|
          format.html { redirect_to learned_course_path(@learned_course), notice: 'resource not found' }
          format.json { head :no_content }
        end
      else
        @learned_concept.resource_id=@concept_resource.id
      end

    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_concept
    @concept = Concept.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def concept_params
    params.require(:concept).permit(:level, :title, :course_id, prerequisite_ids:[])
  end
end
