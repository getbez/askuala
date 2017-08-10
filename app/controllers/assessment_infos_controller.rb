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
  @student_answer = StudentAnswer.new
  @assessment_info = AssessmentInfo.new
  @assessment = Assessment.find(params[:assessment_id])
  @assessment_info.assessment_id = @assessment.id

  #LearnedConcept.where([concept_id: @assessment.target_concept,student_user_id: current_user.id])

end

# GET /assessment_infos/1/edit
def edit
end

# POST /assessment_infos
# POST /assessment_infos.json
def create
  student_answers_hash = assessment_info_params[:student_answers]
  student_answers = student_answers_hash.collect { |s| StudentAnswer.new( s)}

  assessment_info_map = assessment_info_params.except(:student_answers)



  assessment_info_map[:student_answers] = student_answers

  @assessment_info = AssessmentInfo.new( assessment_info_map )
    @assessment_info.student_user_id = current_user.id





  respond_to do |format|
    correct_count = 0
    if @assessment_info.save

      @assessment_info.student_answers.each do |student_answer|

        sa = StudentAnswer.find(student_answer.id)

        if sa.question.question_type == 0
          if sa.answer_choice_id == sa.question.question_answers.first.choice_id
            sa.correct = true
          correct_count = correct_count + 1
          else
            sa.correct = false
          end
          sa.save!
        elsif student_answer.question.question_type == 1
          if student_answer.answer_text == student_answer.question.answer
            sa.correct = true
          correct_count = correct_count + 1
          else
            sa.correct = false
          end
          sa.save!
        end

      end

      @assessment_info.result = correct_count.to_d/@assessment_info.student_answers.count*100
      #if result less than passing grade set the concept as incomplete
      @learned_concept = LearnedConcept.find_by(concept_id: @assessment_info.assessment.concept_id)

      if @assessment_info.result < @assessment_info.assessment.min_passing_grade
        @learned_concept.completed = false
      else
        @learned_concept.completed = true
      end
      @learned_concept.save
      @assessment_info.save
      format.html { redirect_to @assessment_info, notice: 'assessment was submitted.' }
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
    @assessment_info = AssessmentInfo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def assessment_info_params
    params.require(:assessment_info).permit(:assessment_id,student_answers: [:question_id,:answer_choice_id,:answer_text])
  end
end
