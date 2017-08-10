class AddCorrectToStudentAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :student_answers, :correct, :boolean
  end
end
