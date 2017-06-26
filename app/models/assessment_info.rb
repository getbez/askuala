class AssessmentInfo < ApplicationRecord
  belongs_to :assessment
  belongs_to :learned_concept
end
