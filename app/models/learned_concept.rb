# t.integer   :learned_course_id
# t.datetime  :end_time
# t.datetime  :start_time
# t.integer   :concept_id
# t.integer    :resource_id
# t.boolean   :completed
class LearnedConcept < ApplicationRecord
  belongs_to :learned_course
end
