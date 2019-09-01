class AddCorrectToStudentAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :student_answers, :correct, :boolean
  end
end
