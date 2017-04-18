class CreateLearnedCourses < ActiveRecord::Migration
  def change
    create_table :learned_courses do |t|
      t.float  :completion_level, null: false
      t.integer :current_concept
      t.float  :current_grade, default: 0
      t.string :starting_level
      t.integer :course_id
      t.integer :student_id
    end
  end
end
