# t.float  :completion_level, null: false
# t.integer :current_concept
# t.float  :current_grade, null: false
# t.string :starting_level
# t.string :course_id
# t.string :student_user_id

class LearnedCourse < ApplicationRecord
  has_many :learned_concepts 
end
