require 'set'

class LearnedCoursesController < ApplicationController

  before_action :set_learned_course, only: [:show, :edit, :update, :destroy]

  # GET /learned_courses
  # GET /learned_courses.json
  def index
    @learned_courses = LearnedCourse.where(student_id: current_user.id )
  end

  # GET /learned_courses/1
  # GET /learned_courses/1.json
  def show
    @available_concepts=get_available_concepts
  end

  # GET /learned_courses/new
  def new
    @learned_course = LearnedCourse.new
  end

  # GET /learned_courses/1/edit
  def edit
  end

  # POST /learned_courses
  # POST /learned_courses.json
  def create
    @learned_course = LearnedCourse.new(learned_course_params)

    respond_to do |format|
      if @learned_course.save
        format.html { redirect_to @learned_course, notice: 'Learned course was successfully created.' }
        format.json { render :show, status: :created, location: @learned_course }
      else
        format.html { render :new }
        format.json { render json: @learned_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learned_courses/1
  # PATCH/PUT /learned_courses/1.json
  def update
    respond_to do |format|
      if @learned_course.update(learned_course_params)
        format.html { redirect_to @learned_course, notice: 'Learned course was successfully updated.' }
        format.json { render :show, status: :ok, location: @learned_course }
      else
        format.html { render :edit }
        format.json { render json: @learned_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learned_courses/1
  # DELETE /learned_courses/1.json
  def destroy
    @learned_course.destroy
    respond_to do |format|
      format.html { redirect_to learned_courses_url, notice: 'Learned course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def get_available_concepts
    
    availables=[]
    if(@learned_course.learned_concepts.empty?)
      availables << Concept.find_by(course_id: @learned_course.course_id,level: 1)
      logger.debug "**************availables: #{availables.to_json}"
    else
      learned_concept_ids = @learned_course.learned_concepts.pluck(:concept_id)
      all_concepts=Concept.where(:course_id => @learned_course.course_id)
      learned_concepts = Concept.where(:id => learned_concept_ids)
=begin
      @learned_course.learned_concepts.each do |lc|
        learned_concepts << Concept.find(lc.concept_id)
      end
=end


      remaining_concepts=all_concepts-learned_concepts

      logger.debug "**************all_concepts: #{all_concepts.to_json}"
      logger.debug "**************learned_concept_ids: #{learned_concept_ids}"
      logger.debug "**************learned: #{learned_concepts.to_json}"
      logger.debug "**************remain #{remaining_concepts.to_json}"
      current_concept=Concept.find(@learned_course.current_concept)
      if not LearnedConcept.find_by(concept_id: current_concept.id).completed 
        availables << current_concept
      end
      remaining_concepts.each do |rem|
        rem_set= rem.prerequisites.ids.to_set
        learned_set=learned_concepts.ids.to_set
        if rem_set.subset?(learned_set)
          availables << rem
        end
      end
    end
  
    availables
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_learned_course
    @learned_course = LearnedCourse.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def learned_course_params
    params.require(:learned_course).permit(:completion_level, :current_concept, :current_grade, :starting_level, :course_id, :student_id)
  end
end
