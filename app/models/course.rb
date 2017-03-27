# == Schema Information
#
# Table name: courses
#
#  id               :integer          not null, primary key
#  allowed_time_gap :float            not null
#  description      :string
#  end_date         :datetime
#  passing_grade    :float            not null
#  start_date       :datetime
#  title            :string
#

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
