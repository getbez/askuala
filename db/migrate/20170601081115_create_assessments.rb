class CreateAssessments < ActiveRecord::Migration[5.0]
  def change
    create_table :assessments do |t|
      t.integer :level, null: false
      t.decimal :min_passing_grade, null: false
      t.integer :concept_id, null: false
    end
  end
end
