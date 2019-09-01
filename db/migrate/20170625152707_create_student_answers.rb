class CreateStudentAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :student_answers do |t|
      t.integer :assessment_info_id
      t.integer :question_id
      t.integer :answer_choice_id
      t.string :answer_text

      t.timestamps
    end
  end
end
