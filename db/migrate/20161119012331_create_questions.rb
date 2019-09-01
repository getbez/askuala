class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions  do |t|
      t.string   :DTYPE ,null: false
      t.integer  :average_time, null: false
      t.string   :question_string
      t.integer  :question_type
      t.string   :target_concept
      t.string   :answer
      t.text     :test_code
      t.string   :assessment_id
      t.integer  :difficulty_level_id
    end
  end
end
