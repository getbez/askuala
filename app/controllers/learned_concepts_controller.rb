class LearnedConceptsController < ApplicationController
  before_action :set_learned_concept, only: [:show, :edit, :update, :destroy]

  # GET /learned_concepts
  # GET /learned_concepts.json
  def index
    @learned_concepts = LearnedConcept.all
  end

  # GET /learned_concepts/1
  # GET /learned_concepts/1.json
  def show
  end

  # GET /learned_concepts/new
  def new
    @learned_concept = LearnedConcept.new
  end

  # GET /learned_concepts/1/edit
  def edit
  end

  # POST /learned_concepts
  # POST /learned_concepts.json
  def create
    @learned_concept = LearnedConcept.find_by(concept_id: learned_concept_params[:concept_id])
    if @learned_concept
        @learned_concept.completed = false
        @learned_concept.update(learned_concept_params)

    else
        @learned_concept = LearnedConcept.new(learned_concept_params)
    end

    @learned_concept.end_time=Time.now
    @learned_concept.completed=false



    respond_to do |format|
      if @learned_concept.save
        @learned_course = LearnedCourse.find(@learned_concept.learned_course_id)
        @learned_course.current_concept=@learned_concept.concept_id

        logger.debug "**************learned_concepts: #{@learned_course.learned_concepts.count}"
        logger.debug "**************all_concepts: #{Course.find(@learned_course.course_id).concepts.count}"

        # lc_count= @learned_course.learned_concepts.count.to_f
        # c_count = Course.find(@learned_course.course_id).concepts.count
        # logger.debug "**************all_ratio:#{lc_count/c_count}"
        # @learned_course.starting_level=1
        # @learned_course.completion_level= lc_count/c_count
        @learned_course.save
        format.html { redirect_to @learned_course, notice: 'Learned concept was successfully created.' }
        format.json { render :show, status: :created, location: @learned_concept }
      else
        format.html { render :new }
        format.json { render json: @learned_concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learned_concepts/1
  # PATCH/PUT /learned_concepts/1.json
  def update
    respond_to do |format|
      if @learned_concept.update(learned_concept_params)
        format.html { redirect_to @learned_concept, notice: 'Learned concept was successfully updated.' }
        format.json { render :show, status: :ok, location: @learned_concept }
      else
        format.html { render :edit }
        format.json { render json: @learned_concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learned_concepts/1
  # DELETE /learned_concepts/1.json
  def destroy
    @learned_concept.destroy
    respond_to do |format|
      format.html { redirect_to learned_concepts_url, notice: 'Learned concept was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learned_concept
      @learned_concept = LearnedConcept.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learned_concept_params
      params.require(:learned_concept).permit(:concept_id, :resource_id, :start_time, :end_time, :completed, :learned_course_id)
    end
end
