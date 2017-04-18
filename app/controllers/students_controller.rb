class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def concept_params
    params.require(:student).permit(:name, :email, :language)
  end

end