# == Schema Information
#
# Table name: learned_courses
#
#  id               :integer          not null, primary key
#  completion_level :float            not null
#  current_concept  :integer
#  current_grade    :float
#  starting_level   :string
#  course_id        :integer
#  student_id       :integer
#

# t.float  :completion_level, null: false
# t.integer :current_concept
# t.float  :current_grade, null: false
# t.string :starting_level
# t.string :course_id
# t.string :student_user_id

class LearnedCourse < ApplicationRecord
  has_many :learned_concepts
  has_many :assessment_infos, through: :learned_concepts
end
