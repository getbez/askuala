# == Schema Information
#
# Table name: learner_preferences
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  preference_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LearnerPreference < ApplicationRecord
  belongs_to  :student
  has_one :preference
end
