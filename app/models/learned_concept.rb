# == Schema Information
#
# Table name: learned_concepts
#
#  id                :integer          not null, primary key
#  learned_course_id :integer
#  end_time          :datetime
#  start_time        :datetime
#  concept_id        :integer
#  resource_id       :integer
#  completed         :boolean          not null
#

# t.integer   :learned_course_id
# t.datetime  :end_time
# t.datetime  :start_time
# t.integer   :concept_id
# t.integer    :resource_id
# t.boolean   :completed
class LearnedConcept < ApplicationRecord
  belongs_to :learned_course
end
