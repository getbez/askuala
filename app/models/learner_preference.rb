class LearnerPreference < ApplicationRecord
  belongs_to  :student
  has_one :preference
end
