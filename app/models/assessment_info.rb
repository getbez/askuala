class AssessmentInfo < ApplicationRecord
  belongs_to :assessment
  belongs_to :learned_concept
  has_many :student_answers

  #accepts_nested_attributes_for :student_answers
end
