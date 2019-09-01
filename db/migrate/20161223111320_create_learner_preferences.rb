class CreateLearnerPreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :learner_preferences do |t|
      t.integer :student_id
      t.integer :preference_id
      t.timestamps
    end
  end
end
