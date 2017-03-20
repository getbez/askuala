# create_table :courses, do |t|
#   t.float    :allowed_time_gap, null: false
#   t.string   :description
#   t.datetime :end_date
#   t.float    :passing_grade, null: false
#   t.datetime :start_date
#   t.string   :title
# end

class Course < ApplicationRecord
  has_many :concepts
  has_many :grade_levels
  has_many :authors
  has_many :grade_levels
end
