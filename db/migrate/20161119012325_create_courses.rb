class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.float    :allowed_time_gap, null: false
      t.string   :description
      t.datetime :end_date
      t.float    :passing_grade, null: false
      t.datetime :start_date
      t.string   :title
    end
  end
end
