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

require 'test_helper'

class LearnerPreferenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
